import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        Button {
            property bool toggle: false
            text: "Залипание"

            down: toggle
            onClicked: toggle = !toggle
        }

        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Task3.qml"))
        }
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
