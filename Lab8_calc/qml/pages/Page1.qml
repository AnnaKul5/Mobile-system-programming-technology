import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.appname.calc 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Calc {
        id: calc
    }


    property double result1: 0
    property double result2: 0
    Column {
        id: column
        width: parent.width
        anchors.centerIn: parent
        spacing: 20

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                id: label01;
                text: "Re = "
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                width: 200
                id: field1
                onTextChanged: calc.m_num_1 = text - 0
            }
            Label {
                id: label02;
                text: "Im = "
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                width: 200
                id: field2
                onTextChanged: calc.m_num_2 = text - 0
            }
}
        Row
        {
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                id: label03;
                text: "Re = "
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                width: 200
                id: field3
                onTextChanged: calc.m_num_3 = text - 0
            }
            Label {
                id: label04;
                text: "Im = "
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            TextField {
                width: 200
                id: field4
                onTextChanged: calc.m_num_4 = text - 0
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "+"
            onClicked: {
                result1 = calc.add_1()
                result2 = calc.add_2()
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "-"
            onClicked: {
                result1 = calc.sub1()
                result2 = calc.sub2()
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "*"
            onClicked: {
                result1 = calc.mul1()
                result2 = calc.mul2()
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "/"
            onClicked: {
                if (calc.getNum2() !== 0) {
                    result1 = calc.div1()
                    result2 = calc.div2()
                }
            }
        }

            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                id: labelres;
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Result"
                font.pixelSize: Theme.fontSizeExtraLarge
            }


       Label {
            id: label1;
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Re = "+ result1
            font.pixelSize: Theme.fontSizeExtraLarge
        }
        Label {
                    id: label2;
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Im = " + result2
                    font.pixelSize: Theme.fontSizeExtraLarge
                }

    }


}
