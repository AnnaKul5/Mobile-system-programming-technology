import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    ListView {
        spacing: 100

        TextField {
            id: tex
            height: 100
            width: 400
            placeholderText: "ФИО"
            anchors.top: parent.top
        }

        ComboBox {
            id:com
            width:600
            height:200
            label: "Выберите свой пол"
            menu: ContextMenu {
                MenuItem { text: "Мужской" }
                MenuItem { text: "Женский" }
            }
            anchors.top: tex.bottom
        }

        Label {
            id:lab
            text: "Выберите дату рождения"
            anchors.top: com.bottom
        }
        DatePicker {
            id: datepic
            date: new Date()
            daysVisible: true
            weeksVisible: true
            onDateTextChanged: console.log(this.date)
            anchors.top: lab.bottom
        }

        Label {
            id:lab1
            text: (2023 - datepic.date.getFullYear()).toString()
            anchors.top: datepic.bottom
        }

    }
}
