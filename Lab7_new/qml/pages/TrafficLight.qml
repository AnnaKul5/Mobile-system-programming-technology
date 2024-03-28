import QtQuick 2.0

Rectangle {
    id: circle
    width: 100
    height: 100
    color: parent.color
    border.color: "grey"
    border.width: 2
    radius: width*0.5
    opacity: 1

    function setOpacity(op) {
        circle.opacity = op
    }
}
