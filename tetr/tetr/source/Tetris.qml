import QtQuick 2.3
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

Item {
    signal exitPressed
    property int controlsPanelWidth: 200

    function start(startDifficulty, fieldWidth, fieldHeight) {
        internal.difficulty = startDifficulty;
        internal.score = 0;
        game.difficulty = startDifficulty;
        game.fieldHeight = fieldHeight;
        game.fieldWidth = fieldWidth;
        messageTransition.enabled = false;
        game.paused = false;
        messageTransition.enabled = true;
        game.start();
    }

    function stop() {
        game.stop();
    }

    Item {
        id: controls

        width: controlsPanelWidth

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20

            Text {
                id: headerText

                text: qsTr("TETRIS by DX")

                anchors.horizontalCenter: parent.horizontalCenter

                font {
                    family: "Verdana"
                    pixelSize: 24
                }
            }

            Text {
                text: qsTr("Score: %1").arg(internal.score)
            }

            Text {
                text: qsTr("Difficulty: %1").arg(internal.difficulty)
            }

            Text {
                text: qsTr("Score multiplier: %1").arg(internal.multiplier)
            }

            Text {
                text: qsTr("Next block:")
            }

            Item {
                id: nextBlockDisplay

                Layout.minimumHeight: 100
                Layout.fillHeight: true
            }

            Button {
                text: game.paused ? qsTr("Resume") : qsTr("Pause")
                enabled: !game.over

                Layout.fillWidth: true

                onClicked: {
                    game.paused = !game.paused;
                }
            }

            Button {
                text: qsTr("Exit")

                Layout.fillWidth: true

                onClicked: exitPressed()
            }
        }
    }

    Rectangle {
        id: separator

        width: 1
        color: "gray"

        anchors.left: controls.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Game {
        id: game

        difficulty: internal.difficulty
        onLinesDestroyed: internal.addScore(count);

        anchors.left: separator.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        onNextBlockChanged: {
            if(nextBlock)
             nextBlock.parent = nextBlockDisplay;
        }
    }

    Text {
        id: message

        opacity: 0.0
        state: game.over || game.paused ? "visible" : ""

        font {
            bold: true
            family: "Verdana"
            pointSize: 16
        }

        color: "wheat"
        style: Text.Outline
        styleColor: "black"

        text: game.over ? qsTr("GAME OVER") : qsTr("PAUSE");

        anchors.centerIn: game
        anchors.margins: 0

        states: [
            State {
                name: "visible"

                PropertyChanges {
                    target: message
                    opacity: 1.0
                }
            },

            State {
                name: ""

                PropertyChanges {
                    target: message
                    opacity: 0.0
                }
            }
        ]

        transitions: Transition {
            id: messageTransition

            from: ""
            to: "visible"
            reversible: true

            NumberAnimation {
                property: "opacity"
                duration: 500
            }
        }
    }

    QtObject {
        id: internal

        property int score: 0
        property int difficulty: 0
        property double multiplier: difficulties[difficulty][1]
        property int basic_multiplier: 20.0

        property variant difficulties: [
            //Score, score multiplier
            [0,      1.0],  //0
            [100,    1.1],  //1
            [200,    1.2],  //2
            [400,    1.3],  //3
            [700,    1.5],  //4
            [1100,   1.8],  //5
            [1600,   2.2],  //6
            [2200,   2.6],  //7
            [3500,   3.0],  //8
            [5200,   3.5],  //9
            [10000,  4.2],  //10
            [15000,  5.0],  //11
            [20000,  6.0],  //12
            [30000,  7.5],  //13
            [50000,  10.0], //14
            [100000, 15.0]  //15
        ]

        function addScore(count) {
            score += count * basic_multiplier * multiplier
                    + (count > 1 ? count : 0) * multiplier;

            for(var i = difficulty + 1; i < difficulties.length; ++i) {
                if(score < difficulties[i][0]) {
                    --i;
                    if(difficulty !== i) {
                        difficulty = i;
                    }
                    break;
                }
            }
        }
    }
}
