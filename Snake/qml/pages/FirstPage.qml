import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Rectangle {
        id: back
        anchors.fill: parent
        color: '#dfe6e9'
    }
    Rectangle {
        id: backLogo
        width: 450
        height: 300
        radius: 75
        anchors.centerIn: parent
        color: "#d63031"
    }

    Label {
        width: page.width
        height: 200
        y: 493
        Text {
            id: gameName
            text: qsTr("SNAKE")
            font.pixelSize: 142
            font.bold: true
            color: "#dfe6e9"
            anchors.centerIn: parent
        }

    }
    Label {
        id: startGame
        width: page.width
        height: 300
        y: 540
        Button {
            width: 400
            height: 200
            Text {
                text: qsTr("START GAME")
                font.pixelSize: 60
                anchors.centerIn: parent
                font.bold: true
                color: "#dfe6e9"
            }
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("SecondPage.qml"))
            backgroundColor: "#ff7675"
            highlightBackgroundColor: "#ff7675"
            anchors.centerIn: parent
        }
    }
}
