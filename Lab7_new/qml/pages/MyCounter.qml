import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    width: 200
    height: 150

    border.color: "grey"
    border.width: 10
    radius: 10

    property string num: "0"

    Label {
        text: num
        anchors.centerIn: parent
        color: "black"
    }
}
