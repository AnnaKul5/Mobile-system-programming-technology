import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        Button {

            property int counter: 0

            id: btn
            text: "Счетчик"
            onClicked: counter++
        }
        Label {
            text: btn.counter
        }

        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Task5.qml"))
        }
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
