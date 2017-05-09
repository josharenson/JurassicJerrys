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

    ListView {
        id: listView

        anchors.fill: parent
        header: menuHeader
        model: jsonModel.model
        delegate: menuDelegate
    }

    JSONListModel {
        id: jsonModel
        source: Qt.resolvedUrl("./data/menu.jerry")
    }

    Component {
        id: menuDelegate

        Row {
            topPadding: dip(10)

            Image {
                id: foodPic

                height: dip(64); width: dip(64)
                source: Qt.resolvedUrl(icon)
            }

            Text {
                text: name + "\n" + price
            }
        }
    }

    Component {
        id: menuHeader

        Item {
            width: parent.width; height: childrenRect.height
            Image {
                id: headerImage
                objectName: "headerImage"

                height: dip(60)
                anchors.horizontalCenter: parent.horizontalCenter

                fillMode: Image.PreserveAspectFit
                source: Qt.resolvedUrl("./resources/images/dinosaur.png")
            }

            Text {
                id: headerText

                anchors.top: headerImage.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Jurassic Jerry's"
            }

            Rectangle {
                id: divider

                anchors {
                    left: parent.left
                    right: parent.right
                    top: headerText.bottom
                    margins: dip(20)
                }

                height: dip(2)
                color: "black"
            }
        }
    }
}
