import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent
        width: 600

        ComboBox {
            label: "Выпадающий список"
            description: "Описание выпадающего списка"
            menu: ContextMenu {
                MenuItem { text: "1" }
                MenuItem { text: "2" }
                MenuItem { text: "3" }
            }
            onCurrentIndexChanged: console.log(value)
        }

        Button {
            text: "Вперёд"
            onClicked: pageStack.push(Qt.resolvedUrl("Task8.qml"))
        }
        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
