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
    property int score: 0                   // Счёт
    property int sizex: Screen.width        // Ширина экрана
    property int sizey: Screen.height       // Высота экрана

    property int tgtx: 0
    property int tgty: 0

    property int arrowRot: 0

    property int angle1: Math.atan(2*sizey/sizex) * 180 / Math.PI
    property int angle2: 180 - angle1


    property int targetX:0
    property int targetY:0

    //Здесь мы определяем координаты клика мышки
    MouseArea {
        anchors.fill: parent
        //По клику
        onClicked: {
            if(tgt.visible==false)
            {
                //Узнаём координаты
                tgtx = mouse.x
                tgty = mouse.y

                // angle in degrees
                arrowRot = Math.atan2(tgty - parent.height, tgtx - parent.width / 2) * 180 / Math.PI + 90;
                straight_line();
            }

            //Только если стрела находится в начальном положении (tgt.y == sizey - tgt.height) присваиваем её координате x координату x клика мышки и запускаем анимацию стрелы
            if(tgt.y == sizey - tgt.height)
            {
                tgt.x = tgtx
                runArrow();
                console.log(90-arrowRot)
            }
        }
    }


    Timer {
        id: timer
        interval: 100
        running: true; repeat: true
        onTriggered: {
            // Проверка условий попадания в маленькую мишень

            if(small_target.y < tgt.y &&  tgt.y < small_target.y + small_target.height)
            {
                if (small_target.x < tgt.x+tgt.width/2 &&  tgt.x+tgt.width/2 < small_target.x + small_target.width)
                {
                    console.log("малая мишень")       // выводин в консоль надпись (это было нужно на этапе создания, чтобы отслеживать начисление очков за попадание. Сейчас строка не нужна)
                    score = score +2                 // +2 очка за попадание
                }
            }
            // Проверка условий попадания в большую мишень

            if(big_target.y < tgt.y && tgt.y< big_target.y + big_target.height)
            {
                if(big_target.x < tgt.x+tgt.width/2 && tgt.x < big_target.x+tgt.width/2 + big_target.width)
                {
                    console.log("большая мишень")
                    score ++                         // +1 очко за попадание
                }
            }

            if (score >= 5)      //если игрок набрал 5 очков
            {
                end_rect.visible = true   // становится видимым поле победы с кнопкой "начать заново"

                //Все остальные объекты становятся невидимыми

                scoreLabel.visible = false
                arrowContainer.visible = false
                small_tgt.visible = false
                big_tgt.visible = false

            }

        }
    }
    //Функция, которая запускает движение стрелы. Стрела становится видимой и запускается
    //анимация движения снизу вверх до конца экрана
    function runArrow() {
        if (tgt.visible === false) {
            tgt.visible = true
            animation.running = true
        }
    }

    function straight_line()
    {
        if((90 - arrowRot) < angle1){
            targetX = sizex - tgt.width
            console.log("В правую стену")
            targetY = tgty + (tgt.y-tgty)*(targetX-tgtx)/(tgt.x-tgtx)
        }

        if((90 - arrowRot) > angle2){
            targetX = tgt.width
            console.log("В левую стену")
            targetY = tgty + (tgt.y-tgty)*(targetX-tgtx)/(tgt.x-tgtx)
        }
        else
        {
            targetY = 0
            targetX = tgtx + (tgt.x-tgtx)*(targetY-tgty)/(tgt.y-tgty)
        }
    }

    // Объект, хранящий стрелу
    Item {
        id: arrowContainer
        // Узкий прямоуголькок ширина - 1
        Rectangle {
            id: tgt
            visible: false
            width: 1
            height: sizex / 6
            x: sizex / 2
            y: sizey - height
            rotation: arrowRot

            // Изображение стрелы
            Image {
                height: sizey/6
                width: sizey/8
                source: "arrow.png"
                anchors.centerIn: parent
            }

            ParallelAnimation {
                id: animation
                running: false      // по дефолту анимация не запущена
                // Цель анимации target: tgt.  Параметр, по которому меняется координата  property: "y".
                // До какого значения меняется y  to: tgt.targetY (переменная объявлена выше). Продолжительность анимации: duration: 1000
                NumberAnimation { target: tgt; property: "y"; to: targetY; duration: 1000 }
                NumberAnimation { target: tgt; property: "x"; from: parent.width / 2; to: targetX; duration: 1000 }
            }
            //Анимация не зациклена

            // При изменении y происходит проверка: достиг ли y значения 0 (верхняя граница экрана)
            // Тогда стрела перемещается обратно вниз и становится невидимой
            onYChanged: {
                if (tgt.y == targetY) {
                    tgt.y = sizey - sizex / 6
                    tgt.x = sizex / 2
                    tgt.visible = false
                }
            }
             onXChanged: {
                    if (tgt.x == targetX) {
                        tgt.y = sizey - sizex / 6
                        tgt.x = sizex / 2
                        tgt.visible = false
                    }
            }
        }
    }


    //Объект - маленькая мишень. Содержин прямоугольник с радиусом radius: width / 2 (поэтому круглый)
    // Содержит изображение мишени и анимацию
    Item
    {
        id: small_tgt
        Rectangle {
            id: small_target
            width: sizex / 9
            height: sizex / 9
            x: 0
            y: sizey/4
            radius: width / 2

            property int startX: 0
            property int targetX: sizex - small_target.width

            Image {
                height: sizey/9
                width: sizey/9
                source: "target.png"
                anchors.centerIn: parent
            }
        }
        // Мишень движется из крайнего левого угла в крайний правый за 2 зацикленных шага
        SequentialAnimation {
            running: true              // по дефолту анимация запущена
            loops: Animation.Infinite  //движение непрерывное
            //движение слева направо по параметру x на протяжении 1000 милисекунд
            NumberAnimation { target: small_target; property: "x"; to: small_target.targetX; duration: 2000 }
            //движение справа налево по параметру x на протяжении 1000 милисекунд
            NumberAnimation { target: small_target; property: "x"; to: small_target.startX + 2; duration: 2000 }
        }

    }



    //Объект - большая мишень. Анологична маленькой, только больше размером и двигается медленнее
    // duration: 2000
    Item
    {
        id: big_tgt
        Rectangle {
            id: big_target
            width: sizex / 6
            height: sizex / 6
            x: 0
            y: sizey/12
            radius: width / 2

            property int startX: 0
            property int targetX: sizex - big_target.width

            Image {
                height: sizey/6
                width: sizey/6
                source: "target.png"
                anchors.centerIn: parent
            }

            SequentialAnimation {
                running: true
                loops: Animation.Infinite
                NumberAnimation { target: big_target; property: "x"; to: big_target.targetX; duration: 4000 }
                NumberAnimation { target: big_target; property: "x"; to: big_target.startX + 2; duration: 4000 }
            }
        }
    }


    //Надпись в верхнем левом углу экрана. Отображает очки игрока

    Label {
        id: scoreLabel
        visible: true
        x: 50
        anchors.top: parent.top
        text: "Счёт: " + score.toString()
    }

    // Объект, отображающий прямоугольник с надписью label "Победа!" и кнопкой button "Начать сначала"
    Rectangle {
        id: end_rect
        visible: false          //изначально этот объект невидим
        width: 3*sizex/5
        height: sizey/4
        color: "white"
        border.color: "black"
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
                text: "Победа!"
                font.pixelSize: Theme.fontSizeExtraLarge

            }

            //button "Начать сначала"

            Button {
                id:start
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Начать сначала"
                onClicked: {
                    //Сам прямоугольник "победы" становится невидимым
                    end_rect.visible = false

                    //Остальные объекты становяться видимыми, обнуляется счёт, заново запускается таймер
                    scoreLabel.visible = true
                    score = 0
                    arrowContainer.visible = true
                    small_tgt.visible = true
                    big_tgt.visible = true

                }
            }
        }
    }
}
