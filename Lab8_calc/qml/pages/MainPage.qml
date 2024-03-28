import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        //title: qsTr("COOL LAB 8")
    }


    Column{

            anchors.fill: parent
            anchors.margins: Theme.paddingLarge
            anchors.topMargin: 150
            spacing: Theme.paddingMedium


            Button{
                text: "Страница 1"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("Page0.qml"))
            }

            Button{
                text: "Страница 2"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
            }

            Button{
                text: "Страница 3"
                anchors.horizontalCenter: parent.horizontalCenter
               onClicked: pageStack.push(Qt.resolvedUrl("Page1.qml"))
            }


//            Button{
//                text: "Extra"
//                onClicked: pageStack.push(Qt.resolvedUrl("extra.qml"))
//            }


        }
}
