import QtQuick 2.3
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

Item {
    signal start
    signal options

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Text {
            text: qsTr("TETRIS by DX")

            font {
                bold: true
                family: "Verdana"
                pointSize: 14
            }

            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Block {
                color: "yellow"
                figure: [
                    [0,1,0,1,0],
                    [0,0,0,0,0],
                    [0,0,1,0,0],
                    [1,0,0,0,1],
                    [0,1,1,1,0]
                ]

                anchors.centerIn: parent
            }
        }

        Button {
            text: qsTr("Start game")

            Layout.fillWidth: true

            onClicked: {
                start();
            }
        }

        Button {
            text: qsTr("Options")

            Layout.fillWidth: true

            onClicked: {
                options();
            }
        }

        Button {
            text: qsTr("Quit game")

            Layout.fillWidth: true

            onClicked: {
                Qt.quit();
            }
        }
    }
}

