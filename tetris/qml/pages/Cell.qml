import QtQuick 2.3

Rectangle {
    border {
        color: "black"
        width: 1
    }

    radius: Math.min(width, height) / 5;
    smooth: true
}

