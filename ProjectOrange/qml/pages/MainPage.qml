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
import QtQuick.Particles 2.0
Page {
    property int time: 0
    property int score: 0
    property int lose: 0
    property int sizex: Screen.width
    property int sizey: Screen.height

    Timer {
        id: timer
        interval: 1000
        running: true; repeat: true
        onTriggered: {
            parent.time = parent.time + 1
            if (lose >= 3)
            {
                end_rect.visible = true
                scoreLabel.visible = false
                timeLabel.visible = false
                timer.running = false
            }
            createOrange()
        }
    }

                function createOrange() {
                    var orangeComponent = Qt.createComponent("Orange.qml")
                    if (orangeComponent.status === Component.Ready) {
                        var orange = orangeComponent.createObject(orangeContainer)
                        orange.visible = true
                    }
                }
                Item {
                    id: orangeContainer
                }



        Label {
            id: scoreLabel
            visible: true
            x: 50
            anchors.top: parent.top
            text: "Счёт: " + score.toString()
        }
        Label {
            id: timeLabel
            visible: true
            x: sizex - 200
            anchors.top: parent.top
            text: "Время: " + time.toString()
        }


        Rectangle {
            id: end_rect
            visible: false
            width: 4*sizex/5
            height: 1*sizey/3
            color: "lightblue"
            border.color: "black"
            radius: 30
            anchors.centerIn: parent

        Column {
                id: column
                visible: true
                width: parent.width
                anchors.centerIn: parent
                spacing: 30
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: label_end;
                    text: "Игра окончена"
                    font.pixelSize: Theme.fontSizeExtraLarge

                }
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: label_score;
                        text: "Итоговый счёт: " + score
                    }
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: label_time;
                        text: "Итоговое время: " + time
                    }
                }
        }

}
