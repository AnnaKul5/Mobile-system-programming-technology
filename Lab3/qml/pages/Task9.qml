import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Column {
        spacing: 100
        anchors.centerIn: parent

        Slider {
            width: 500
            label: "Слайдер"
            maximumValue: 50
            minimumValue: 0
            value: 10
            stepSize: 2
            valueText: value
            onValueChanged: console.log(value)
            id: slider
        }

        Label {
            text: + slider.value
        }

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
    }
}
