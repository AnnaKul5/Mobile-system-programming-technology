import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent


        TextField {
            placeholderText: "ФИО"

            inputMethodHints: Qt.ImhDigitsOnly
        }

        ComboBox {
            label: "Выберите свой пол"
            menu: ContextMenu {
                MenuItem { text: "Мужской" }
                MenuItem { text: "Женский" }
            }
        }

        Label {
            text: "Выберите дату рождения"
        }
        DatePicker {
            id: datepic
            date: new Date()
            daysVisible: true
            weeksVisible: true
            onDateTextChanged: console.log(this.date)
        }

        Label {
            text: datepic.date - Date.now()
        }

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
