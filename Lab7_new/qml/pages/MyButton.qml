import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: rectangle
    height: 300;
    width: 500;
    color: setColor
    property string setColor: "blue"
    property string btnText: "text"
    Button {
        height: parent.height;
        width: parent.width;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        text: btnText
    }

    MouseArea {
            anchors.fill: parent
            onClicked: console.log("Clicked!")
        }

        function changeColor(color) {
             rectangle.setColor = color;
        }


    Component.onCompleted: {
        for (var i = 0; i < this.children.length; i++) {
            console.log(this.children[i])

            if (this.children[i].text) {
                if (this.children[i].text !== btnText) {
                    btnText = this.children[i].text
                }
            }
        }
    }
}

