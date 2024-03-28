import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.appname.counter 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Counter {
        id: counter
        m_count: 42
    }

    Column {
        id: column
        width: parent.width
        anchors.centerIn: parent
        spacing: 20

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            id: l1
            text: counter.m_count
            font.pixelSize: Theme.fontSizeExtraLarge
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            text: "Увеличить"
            onClicked: {
                counter.inc();
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            text: "Сбросить"
            onClicked: {
                counter.reset()
            }
        }

    }

}
