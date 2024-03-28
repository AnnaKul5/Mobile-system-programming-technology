import QtQuick 2.3
import "Utils.js" as Utils

Item {
    id: game

    property int difficulty: 0
    property int fieldWidth: 12
    property int fieldHeight: 15
    property Block nextBlock: null
    property bool paused: false
    property bool over: field.over

    signal linesDestroyed(int count)
    signal gameOver

    onDifficultyChanged: internal.addFigures()

    function start() {
        internal.initGame();
        internal.applyDifficulty();
        field.start();
    }

    function stop() {
        field.stop();
    }

    Field {
        id: field
        anchors.fill: parent
        difficulty: game.difficulty
        paused: game.paused
        fieldWidth: game.fieldWidth
        fieldHeight: game.fieldHeight

        onNeedNextBlock: {
            addNextBlock(nextBlock);
            internal.createBlock();
        }

        onGameOver: game.gameOver()
        onLinesDestroyed: game.linesDestroyed(count)
    }

    QtObject {
        id: internal

        property int prevDifficulty: 0

        property variant figures: [
            [[0,1],[0,1],[1,1]],
            [[1,0],[1,0],[1,1]],
            [[1,1],[1,1]],
            [[1],[1],[1],[1]],
            [[1,1,0],[0,1,1]],
            [[0,1,1],[1,1,0]],
            [[0,1,0],[1,1,1]]
        ];

        property int basicFigureCount: 0

        Component.onCompleted: {
            basicFigureCount = figures.length;
        }

        function createColor() {
            return Qt.rgba(Math.random() * 0.7 + 0.3,
                           Math.random() * 0.7 + 0.3,
                           Math.random() * 0.7 + 0.3, 1);
        }

        function applyDifficulty() {
            prevDifficulty = 0;

            var targetDifficulty = difficulty + 1;
            difficulty = 0;
            for(var i = 0; i !== targetDifficulty; ++i)
                difficulty = i; //Triggers addFigures()
        }

        function initGame() {
            figures.splice(basicFigureCount, figures.length - basicFigureCount);

            if(nextBlock) {
                nextBlock.parent = null;
                nextBlock = null;
            }

            createBlock();
        }

        function createBlock() {
            var block = Qt.createComponent("Block.qml");
            var figure = figures[Math.floor(Math.random() * figures.length)];
            var rotation = Math.floor(Math.random() * 5);
            for(var i = 0; i !== rotation; ++i)
                figure = Utils.rotateFigure(figure);

            nextBlock = block.createObject(null, {color: createColor(), figure: figure});
        }

        function addFigures() {
            if(difficulty === prevDifficulty)
                return;

            switch(difficulty) {
            case 2:
                figures.push([[1]]);
                break;

            case 4:
                figures.push([[1,1,1],[1,1,1],[1,1,1]]);
                break;

            case 6:
                figures.push([[0,1,0],[0,1,0],[1,1,1]]);
                break;

            case 10:
                figures.push([[1,1,0],[0,1,0],[0,1,1]]);
                figures.push([[0,1,1],[0,1,0],[1,1,0]]);
                break;
            }

            prevDifficulty = difficulty;
        }
    }
}

