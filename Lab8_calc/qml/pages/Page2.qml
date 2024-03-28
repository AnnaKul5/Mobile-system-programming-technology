import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.appname.stringlist 1.0

Page {

    StringList {
        id: stringList
    }

    Column {
        id: column
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        y: 300

        TextField {
            id: textField;
            placeholderText: "Введите слово"
        }

        Button {
            text: "Добавить слово"
            width: parent.width
            onClicked: {
                stringList.add(textField.text)
                label.text = stringList.getAll();
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button {
            text: "Удалить слово"
            width: parent.width
            onClicked: {
                stringList.popBack();
                label.text = stringList.getAll();
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }


        TextField {
            id: label;
            width: parent.width;
            x: Theme.horizontalPageMargin
            text: stringList.getAll()
            readOnly: true;
            wrapMode: TextInput.Wrap
        }
    }



//    Button {
//        anchors.horizontalCenter: parent.horizontalCenter
//        y: parent.height - 400
//        text: "Счетчик"
//        onClicked: pageStack.replace(Qt.resolvedUrl(qsTr("Page1.qml")))
//    }
}
