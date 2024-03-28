import QtQuick 2.0
import Sailfish.Silica 1.0
import com.counter 1.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Счётчик"
    }


    Counter {
        id: counter
        count: 1
    }

    Column {
        id: column
        width: parent.width
        anchors.centerIn: parent
        spacing: 20

        Label {
            id: label;
            anchors.horizontalCenter: parent.horizontalCenter
            text: counter.getCount();
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Увеличить"
            onClicked: {
                counter.inc();
                label.text = counter.getCount();
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Обнулить"
            onClicked: {
                counter.reset();
                label.text = counter.getCount();
            }
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Перейти к списку"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
    }
}
