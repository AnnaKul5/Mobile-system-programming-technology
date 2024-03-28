import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: root
    property int size: 0
    property real value: 0
    property color primaryColor: "#ff6725"
    property color secondaryColor: "#52adff"
    property int animationTime: 1000
    width: size
    height: size

    onValueChanged: c.degree = value % 360

    Canvas {
        id: c
        property real degree: 0

        anchors.fill: parent
        antialiasing: true
        onDegreeChanged: requestPaint()

        onPaint: {
            var ctx = getContext("2d");

            var x = root.width / 2;
            var y = root.height / 2;

            var radius = root.size / 2
            var startAngle = (Math.PI / 2) * 3;
            var fullAngle = (Math.PI / 2) * 7;
            var progressAngle = (Math.PI / 180) * (degree + 270);

            ctx.reset()

            ctx.fillStyle = root.primaryColor;
            ctx.beginPath();
            ctx.moveTo(x,y);
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.lineTo(x, y)
            ctx.fill();

            if (value % 360 === 0)
            {
               ctx.fillStyle = root.secondaryColor;
               ctx.fill();
               ctx = getContext("2d");

            }
        }

        Behavior on degree {
            NumberAnimation {
                duration: root.animationTime
            }
        }
    }
}
