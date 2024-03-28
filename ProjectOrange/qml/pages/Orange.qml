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

Item {
    id: orange
    Rectangle {
        id: tgt
        width: sizey / 10
        height: sizey / 10
        x: Math.random() * (sizex - 2 * tgt.width)
        y: sizey
        radius: width / 2

        property int startY: sizey
        property int targetY: Math.random() * (sizey / 4) + sizey / 4

        Image {
            height: sizey/10
            width: sizey/10
            source: "orange.png"
            anchors.centerIn: parent
        }

        Button {
            anchors.centerIn: parent
            width: tgt.width
            height: tgt.height
            opacity: 0
            onClicked: {
                score++
                tgt.destroy()
            }
        }

        SequentialAnimation {
            running: true
            NumberAnimation { target: tgt; property: "y"; to: tgt.targetY; duration: 1500 }
            NumberAnimation { target: tgt; property: "y"; to: tgt.startY + 2; duration: 1500 }
        }

        RotationAnimation on rotation {
             loops: Animation.Infinite
             duration: 1000
             from: 0
             to: 180
         }

        onYChanged: {
                if (tgt.y == sizey + 2) {
                    tgt.destroy()
                    lose++
                    //console.log(lose)
                }
            }

    }
}
