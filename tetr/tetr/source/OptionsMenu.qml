import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Item {
    id: optionsMenu

    property int fieldWidth: 12
    property int fieldHeight: 15
    property int difficulty: 0
    property int minFieldWidth: 10
    property int minFieldHeight: 10
    property int maxFieldWidth: 30
    property int maxFieldHeight: 30
    property int minDifficulty: 0
    property int maxDifficulty: 15

    signal done

    onVisibleChanged: {
        fieldWidthSlider.setValue(fieldWidth);
        fieldHeightSlider.setValue(fieldHeight);
        difficultySlider.setValue(difficulty);
    }

    GridLayout {
        anchors.fill: parent
        columns: 2
        columnSpacing: 10
        rowSpacing: 10

        Text {
            text: qsTr("Game options")
            font {
                family: "Verdana"
                pointSize: 12
            }

            Layout.alignment: Qt.AlignHCenter
            Layout.columnSpan: 2
        }

        Label {
            text: qsTr("Field width")

            Layout.alignment: Qt.AlignTop
        }

        SignedSlider {
            id: fieldWidthSlider

            minValue: minFieldWidth
            maxValue: maxFieldWidth
            initValue: fieldWidth

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("Field height")

            Layout.alignment: Qt.AlignTop
        }

        SignedSlider {
            id: fieldHeightSlider

            minValue: minFieldHeight
            maxValue: maxFieldHeight
            initValue: fieldHeight

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("Start difficulty")

            Layout.alignment: Qt.AlignTop
        }

        SignedSlider {
            id: difficultySlider

            minValue: minDifficulty
            maxValue: maxDifficulty
            initValue: difficulty

            Layout.fillWidth: true
        }

        Item {
            Layout.fillHeight: true
            Layout.columnSpan: 2
        }

        Button {
            text: qsTr("Save")

            Layout.fillWidth: true
            Layout.columnSpan: 2

            onClicked: {
                fieldWidth = fieldWidthSlider.value;
                fieldHeight = fieldHeightSlider.value;
                difficulty = difficultySlider.value;
                done();
            }
        }

        Button {
            text: qsTr("Cancel")

            Layout.fillWidth: true
            Layout.columnSpan: 2

            onClicked: done()
        }
    }
}

