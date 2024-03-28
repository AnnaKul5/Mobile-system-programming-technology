import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Таймер")
    }
    property real angle: 0
    property real seconds: 0

    Item {
        width: 400
        height: 400
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: dial
            width: 500
            height: 500
            color: "white"
            border.color: "black"
            radius: width / 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            QMLCircle {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        size: dial.height
                        value: angle
                        primaryColor: "skyblue"
                        secondaryColor: "white"
                    }

            // Секундная стрелка
            Rectangle {
                id: secondHand
                width: 5
                height: dial.width / 2 - 20
                color: "red"
                radius: width / 2
                rotation: angle
                transformOrigin: Item.Bottom
                anchors.bottom: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                // Анимация вращения секундной стрелки
                Behavior on rotation {
                    NumberAnimation {
                        duration: 1000
                    }
                }
            }
        }


        // Таймер для обновления секундной стрелки
        Timer {
            id:timer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                seconds++
                angle += 6 // Увеличиваем угол на 6 градусов каждую секунду
            }
        }

        Rectangle {
            id: sec
            width: 100
            height: 50
            color: "white"
            border.color: "gray"
            anchors.top: dial.bottom
            anchors.horizontalCenter: dial.horizontalCenter

        Label {
                text: seconds
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color: "black"
            }
        }

    }
    Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            spacing: 20

            Button {
                text: "Стоп"
                onClicked: {
                   timer.running = false
                }
            }
            Button {
                text: "Старт"
                onClicked: {
                   timer.running = true
                }
            }
        }
}

