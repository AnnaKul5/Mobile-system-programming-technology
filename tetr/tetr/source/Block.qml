import QtQuick 2.3

Item {
    id: block

    property variant figure: [[1]]
    property double cellWidth: 20
    property double cellHeight: 20
    property double cellsFromTop: 0
    property double cellsFromLeft: 0
    property int yCellCount: 0
    property int xCellCount: 0
    property color color: "red"

    signal hidden

    x: cellsFromLeft * cellWidth
    y: cellsFromTop * cellHeight

    width: cellWidth * xCellCount
    height: cellHeight * yCellCount

    Component.onCompleted: internal.createItem()

    onFigureChanged: {
        yCellCount = figure.length;
        xCellCount = figure[0].length;
        internal.clearItem();
        internal.createItem();
    }

    onVisibleChanged: {
        if(!visible)
            hidden();
    }

    function disappear() {
        state = "disappeared";
    }

    QtObject {
        id: internal
        function clearItem() {
            block.children = [];
        }

        function createItem() {
            var component = Qt.createComponent("Cell.qml");
            for(var i = 0; i !== yCellCount; ++i) {
                for(var j = 0; j !== xCellCount; ++j) {
                    if(!figure[i][j])
                        continue;

                    component.createObject(block,
                                           {
                                               width: Qt.binding(function() {
                                                   return cellWidth;
                                               }),
                                               height: Qt.binding(function() {
                                                   return cellHeight;
                                               }),
                                               color: color,
                                               x: Qt.binding((function(idx) {
                                                   return function() {
                                                       return cellWidth * idx;
                                                   }
                                               })(j)),
                                               y: Qt.binding((function(idx) {
                                                   return function() {
                                                       return cellHeight * idx;
                                                   }
                                               })(i))
                                           });
                }
            }
        }
    }

    states: State {
        name: "disappeared"

        PropertyChanges {
            target: block
            opacity: 0
            visible: false
        }
    }

    transitions: Transition {
        from: ""
        to: "disappeared"
        SequentialAnimation {
            NumberAnimation {
                property: "opacity"
                duration: 300
            }
            PropertyAction {
                property: "visible"
                value: false
            }
        }
    }
}

