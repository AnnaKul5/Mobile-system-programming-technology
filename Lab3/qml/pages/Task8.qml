import QtQuick 2.0
import Sailfish.Silica 1.0
import "."

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        Switch {
            id: mute
            icon.source: "image://theme/icon-m-speaker-mute?"
                         + (checked ? Theme.highlightColor
                                    : Theme.primaryColor)
            onCheckedChanged: Store.run = !Store.run
        }
        Label {
            text: "Звук " + (mute.checked ? "включён" : "выключен")
        }

        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Task9.qml"))
        }
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
