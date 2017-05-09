import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

import "lib"

ApplicationWindow {
    id: root

    minimumHeight: 800
    minimumWidth: 600
    visible: true

    // A Hack to get device independent pixels since devicePixelRatio
    // _sometimes_ reports an incorrect value
    function dip(n) { return Math.round(n * (Screen.pixelDensity / 6.2)) }

    // Provides a white background to make the demo look nicer
    Rectangle {
        anchors.fill: parent
        color: "white"
    }
}
