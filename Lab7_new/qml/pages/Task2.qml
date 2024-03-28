import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 2")
    }

    Column {
        anchors.centerIn: parent
        spacing: circleWidth / 10

        property int circleWidth: 100
        property int delayCnt: 0

        Rectangle {
            id: redCircle
            width: parent.circleWidth
            height: width
            color: "red"
            border.color: "grey"
            border.width: 2
            radius: width*0.5
            opacity: 1
        }

        Rectangle {
            id: yellowCircle
            width: parent.circleWidth
            height: width
            color: "yellow"
            border.color: "grey"
            border.width: 2
            radius: width*0.5
            opacity: 0.3
        }

        Rectangle {
            id: greenCircle
            width: parent.circleWidth
            height: width
            color: "green"
            border.color: "grey"
            border.width: 2
            radius: width*0.5
            opacity: 0.3
        }

        IconButton {
            id: person
            icon.source: "image://theme/icon-m-media-artists"
            onClicked: console.log("Play clicked!")
            opacity: 0
            x: parent.width * (-1) - 500

            PropertyAnimation {
                id: animation_forward
                target: person;
                property: "x";
                from: parent.width * (-1) - 50;
                to: parent.width + 50;
                duration: 1000;
            }
        }

        Timer {
            interval: 100; running: true; repeat: true
            onTriggered: parent.delayCnt = (parent.delayCnt + 1) % 40
        }

        state: {
            if (delayCnt < 10){
                "red"
            } else if (delayCnt < 20) {
                "yellow_red"
            } else if (delayCnt < 30) {
                "green"
            } else {
                "yellow"
            }
        }

        states: [
            State {
                name: "red"
                PropertyChanges { target: redCircle; opacity: 1}
                PropertyChanges { target: yellowCircle; opacity: 0.3}
                PropertyChanges { target: greenCircle; opacity: 0.3}
            },
            State {
                name: "yellow_red"
                PropertyChanges { target: redCircle; opacity: 1}
                PropertyChanges { target: yellowCircle; opacity: 1}
                PropertyChanges { target: greenCircle; opacity: 0.3}
            },
            State {
                name: "green"
                PropertyChanges { target: redCircle; opacity: 0.3}
                PropertyChanges { target: yellowCircle; opacity: 0.3}
                PropertyChanges { target: greenCircle; opacity: 1}
                PropertyChanges { target: person; opacity: 1}
                StateChangeScript {
                    script: animation_forward.running = true;
                }
            },
            State {
                name: "yellow"
                PropertyChanges { target: redCircle; opacity: 0.3}
                PropertyChanges { target: yellowCircle; opacity: 1}
                PropertyChanges { target: greenCircle; opacity: 0.3}
            }
        ]
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        spacing: 20

        Button {
            text: "Назад"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Вперед"
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task3.qml")))
        }
    }
}
