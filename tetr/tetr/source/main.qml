import QtQuick 2.3
import QtQuick.Window 2.0
Window {

    id: window

    visible: true
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480
    title: qsTr("Tetris by DX")

    MainMenu {
        id: mainMenu

        anchors.fill: parent
        anchors.margins: 20

        onStart: {
            visible = false;
            tetris.visible = true;
            var desiredBlockSize = 20;

            var windowWidth = optionsMenu.fieldWidth * desiredBlockSize;
            var windowHeight = optionsMenu.fieldHeight * desiredBlockSize;

            var ratio = windowHeight / windowWidth;
            if(windowWidth < window.minimumWidth) {
                windowHeight += (window.minimumWidth - windowWidth) * ratio;
                windowWidth = window.minimumWidth;
            }
            if(windowHeight < window.minimumHeight) {
                windowWidth += (window.minimumHeight - windowHeight) / ratio;
                windowHeight = window.minimumHeight;
            }

            windowWidth += tetris.controlsPanelWidth;

            windowWidth = Math.min(windowWidth, Screen.width);
            windowHeight = Math.min(windowHeight, Screen.height);

            var centerWindow = window.height !== windowHeight || window.width !== windowWidth;

            window.height = windowHeight;
            window.width = windowWidth;

            if(centerWindow) {
                window.x = (Screen.width - windowWidth) / 2;
                window.y = (Screen.height - windowHeight) / 2;
            }

            tetris.start(optionsMenu.difficulty,
                         optionsMenu.fieldWidth,
                         optionsMenu.fieldHeight);
        }

        onOptions: {
            visible = false;
            optionsMenu.visible = true;
        }
    }

    OptionsMenu {
        id: optionsMenu

        visible: false

        anchors.fill: parent
        anchors.margins: 20

        onDone: {
            visible = false;
            mainMenu.visible = true;
        }
    }

    Tetris {
        id: tetris

        visible: false

        anchors.fill: parent

        onExitPressed: {
            stop();
            visible = false;
            mainMenu.visible = true;
        }
    }
}
