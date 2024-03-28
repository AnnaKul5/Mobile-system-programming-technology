/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/
import QtQuick 2.0
import Sailfish.Silica 1.0
Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Задание 9")
    }
    SilicaListView {
        PullDownMenu {
            MenuItem {
                text: "1"
                onClicked: field.text = text
            }
            MenuItem {
                text: "2"
                onClicked: field.text = text
            }
            MenuLabel { text: qsTr("Menu Label") }
        }
        anchors {
            left: parent.left; right: parent.right;
        }
        height: parent.height * 0.2
        y: parent.height * 0.2
        header: PageHeader { title: "Simple List" }
    }
    TextField {
        id: field
        text: "123"
        anchors.centerIn: parent
    }
    SilicaListView {
        PushUpMenu {
            MenuItem {
                text: "3"
                onClicked: field.text = text
            }
            MenuItem {
                text: "4"
                onClicked: field.text = text
            }
            MenuLabel { text: qsTr("Menu Label") }
        }
        anchors {
            left: parent.left; right: parent.right;
        }
        height: parent.height * 0.2
        y: parent.height * 0.6
        header: PageHeader { title: "Simple List 2" }
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
            text: "Следующая задача"
            onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Task10.qml")))
        }
    }
}


