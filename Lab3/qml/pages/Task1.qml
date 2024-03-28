import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        TextField {
            placeholderText: "Число"

            inputMethodHints: Qt.ImhDigitsOnly
            description: "Число"
        }

        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Task2.qml"))
        }
    }
}
