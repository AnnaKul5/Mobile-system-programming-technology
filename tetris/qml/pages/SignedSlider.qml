import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

ColumnLayout {
    property int minValue: 0
    property int maxValue: 10
    property int initValue: 0
    property int value: slider.value

    spacing: 0

    function setValue(value) {
        slider.value = value;
    }

    Slider {
        id: slider
        activeFocusOnPress: false
        minimumValue: minValue
        maximumValue: maxValue
        stepSize: 1

        Layout.fillWidth: true
    }

    Label {
        text: slider.value

        Layout.alignment: Qt.AlignHCenter
    }
}
