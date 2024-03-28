import QtQuick 2.3
import "Utils.js" as Utils

Item {
    id: field

    property int fieldWidth: 12
    property int fieldHeight: 15
    property int difficulty: 0
    property double cellWidth: field.width / fieldWidth
    property double cellHeight: field.height / fieldHeight
    property bool paused: false
    property bool over: false

    signal gameOver
    signal needNextBlock
    signal linesDestroyed(int count)

    focus: true

    Timer {
        id: fieldTimer
        interval: internal.timerInterval
        running: !over && !paused && internal.timerRunning
        repeat: true
        onTriggered: internal.processBlocks()
    }

    Component.onCompleted: internal.init()

    Keys.onPressed: internal.processKeyPress(event)

    function start() {
        internal.start();
    }

    function stop() {
        internal.stop();
    }

    function addNextBlock(block) {
        var available_positions = [];
        var max_x = fieldWidth - block.xCellCount + 1;
        for(var x = 0; x !== max_x; ++x) {
            if(!internal.intersects(x, 0, block.figure))
                available_positions.push(x);
        }

        if(!available_positions.length)
            available_positions.push(Math.floor(Math.random() * max_x));

        internal.addBlock(block,
                 available_positions[Math.floor(Math.random() * available_positions.length)],
                 0, true);
    }


    QtObject {
        id: internal

        property variant staticBlocksMatrix: []
        property Block currentBlock: null
        property Block failBlock: null
        property bool speedUp: false;
        property int timerInterval: 1000 - field.difficulty * 50
        property int objectsToRemove: 0
        property bool timerRunning: false

        function init() {
            if(staticBlocksMatrix.length !== fieldHeight
                    || staticBlocksMatrix[0].length !== fieldWidth) {
                staticBlocksMatrix = [];
                for(var y = 0; y !== fieldHeight; ++y) {
                    staticBlocksMatrix.push(new Array(fieldWidth));
                    for(var x = 0; x !== fieldWidth; ++x) {
                        staticBlocksMatrix[y][x] = null;
                    }
                }
            }
        }

        function stop() {
            init();

            for(var y = 0; y !== fieldHeight; ++y) {
                for(var x = 0; x !== fieldWidth; ++x) {
                    var block = staticBlocksMatrix[y][x];
                    if(block) {
                        block.parent = null;
                        block.destroy();
                    }

                    staticBlocksMatrix[y][x] = null;
                }
            }

            if(currentBlock) {
                currentBlock.parent = null;
                currentBlock = null;
            }

            if(failBlock) {
                failBlock.parent = null;
                failBlock = null;
            }

            over = false;
            internal.timerRunning = false;
        }

        function start() {
            stop();
            internal.timerRunning = true;
            needNextBlock();
        }

        function processKeyPress(event) {
            if(!currentBlock || !timerRunning)
                return;

            switch(event.key) {
            case Qt.Key_Left:
                if(currentBlock.cellsFromLeft
                        && !intersects(currentBlock.cellsFromLeft - 1, currentBlock.cellsFromTop,
                                       currentBlock.figure)) {
                    --currentBlock.cellsFromLeft;
                }
                break;

            case Qt.Key_Right:
                if(currentBlock.cellsFromLeft + currentBlock.xCellCount < fieldWidth
                        && !intersects(currentBlock.cellsFromLeft + 1, currentBlock.cellsFromTop,
                                       currentBlock.figure)) {
                    ++currentBlock.cellsFromLeft;
                }
                break;

            case Qt.Key_Up:
                rotateCurrentBlock();
                break;

            case Qt.Key_Down:
                if(!speedUp) {
                    speedUp = true;
                    fieldTimer.interval = 20;
                }
                break;
            }
        }

        function rotateCurrentBlock() {
            var new_figure = Utils.rotateFigure(currentBlock.figure);
            var matrix_width = new_figure[0].length;
            var matrix_height = new_figure.length;
            var matrix_left = currentBlock.cellsFromLeft;
            var matrix_top = currentBlock.cellsFromTop;
            if(matrix_width > fieldWidth || matrix_height > fieldHeight)
                return;

            if(matrix_height + matrix_top > fieldHeight)
                return;

            if(matrix_width + matrix_left > fieldWidth)
                matrix_left = fieldWidth - matrix_width;

            var move_left = 0;
            for(var x = 0; x !== matrix_width; ++x) {
                for(var y = 0; y !== matrix_height; ++y) {
                    if(!staticBlocksMatrix[matrix_top + y][matrix_left + x])
                        continue;

                    if(!new_figure[y][x])
                        continue;

                    move_left = Math.max(move_left, matrix_width - x);
                }
            }

            if(move_left) {
                matrix_left -= move_left;
                if(matrix_left < 0)
                    return;
            }

            if(intersects(matrix_left, matrix_top, new_figure))
                return;

            currentBlock.figure = new_figure;
            currentBlock.cellsFromLeft = matrix_left;
        }

        function intersects(cellsFromLeft, cellsFromTop, matrix) {
            var matrix_width = matrix[0].length;
            var matrix_height = matrix.length;
            for(var i = 0; i !== matrix_width; ++i) {
                for(var j = 0; j !== matrix_height; ++j) {
                    if(matrix[j][i]) {
                        if(staticBlocksMatrix[j + cellsFromTop][i + cellsFromLeft])
                            return true;
                    }
                }
            }

            return false;
        }

        function processLines() {
            for(var y = 0; y !== fieldHeight; ++y) {
                var line = true;
                for(var x = 0; x !== fieldWidth; ++x) {
                    if(!staticBlocksMatrix[y][x]) {
                        line = false;
                        break;
                    }
                }

                if(line) {
                    for(x = 0; x !== fieldWidth; ++x) {
                        staticBlocksMatrix[y][x].hidden.connect((function(xCell, yCell) {
                            return function(obj) { removeObject(xCell, yCell) };
                        })(x, y));
                        staticBlocksMatrix[y][x].disappear();
                    }

                    objectsToRemove += fieldWidth;
                }
            }

            if(objectsToRemove) {
                linesDestroyed(objectsToRemove / fieldWidth);
                timerRunning = false;
            }
        }

        function removeObject(xCell, yCell) {
            var obj = staticBlocksMatrix[yCell][xCell];
            obj.parent = null;
            staticBlocksMatrix[yCell][xCell] = null;
            obj.destroy();
            if(!(--objectsToRemove)) {
                for(var y = 0; y !== fieldHeight; ++y) {
                    var remove_line = true;
                    for(var x = 0; x !== fieldWidth; ++x) {
                        if(staticBlocksMatrix[y][x]) {
                            remove_line = false;
                            break;
                        }
                    }

                    if(remove_line && y) {
                        for(var y_before = y; y_before !== 0; --y_before) {
                            for(x = 0; x !== fieldWidth; ++x) {
                                staticBlocksMatrix[y_before][x]
                                        = staticBlocksMatrix[y_before - 1][x];
                                if(staticBlocksMatrix[y_before][x])
                                    ++staticBlocksMatrix[y_before][x].cellsFromTop;
                            }
                        }

                        for(x = 0; x !== fieldWidth; ++x) {
                            staticBlocksMatrix[0][x] = null;
                        }
                    }
                }

                timerRunning = true;
                needNextBlock();
            }
        }

        function processBlocks() {
            if(!currentBlock)
                return;

            if(currentBlock.cellsFromTop + currentBlock.yCellCount < fieldHeight
                    && !intersects(currentBlock.cellsFromLeft, currentBlock.cellsFromTop + 1,
                                   currentBlock.figure)) {
                ++currentBlock.cellsFromTop;
            } else {
                if(speedUp) {
                    fieldTimer.interval = Qt.binding(function() {
                        return timerInterval;
                    });
                    speedUp = false;
                }

                explodeCurrentBlock();
                processLines();

                if(!objectsToRemove)
                    needNextBlock();
            }
        }

        function explodeCurrentBlock() {
            var block = Qt.createComponent("Block.qml");
            var color = currentBlock.color;
            var xCell = currentBlock.cellsFromLeft;
            var yCell = currentBlock.cellsFromTop;
            for(var i = 0; i !== currentBlock.xCellCount; ++i) {
                for(var j = 0; j !== currentBlock.yCellCount; ++j) {
                    if(!currentBlock.figure[j][i])
                        continue;

                    addBlock(block.createObject(null, {color: color}),
                                   xCell + i, yCell + j);
                }
            }

            currentBlock.parent = null;
            currentBlock.destroy();
            currentBlock = null;
        }

        function addBlock(block, xCell, yCell, set_current) {
            block.parent = field;
            block.cellsFromLeft = xCell;
            block.cellsFromTop = yCell;
            block.cellWidth = Qt.binding(function() {
                return cellWidth;
            });
            block.cellHeight = Qt.binding(function() {
                return cellHeight;
            });

            if(intersects(xCell, yCell, block.figure)) {
                over = true;
                gameOver();
                failBlock = block;
                return;
            }

            if(set_current)
                currentBlock = block;
            else
                staticBlocksMatrix[yCell][xCell] = block;
        }
    }
}
