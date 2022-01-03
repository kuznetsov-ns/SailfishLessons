import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page2

    Label {
        id: label3
        width: page.width
        height: 200
        y: 0
        Button {
            id: btn2
            Text {
                id: name3
                text: qsTr("Main menu")
                anchors.centerIn: parent
                font.pixelSize: 48
                color: "black"
            }
            onClicked: pageStack.push(Qt.resolvedUrl("FirstPage.qml"))
            anchors.centerIn: parent
            backgroundColor: "white"
            width: name3.width + 50
        }
    }

    Label {
        width: page2.width
        height: 200
        id:label
        y: 100
        Text {
            id: name
            text: qsTr("Quest #1")
            anchors.centerIn: parent
            font.pixelSize: 81
            color: "white"
        }
    }

    Label {
        width: page2.width
        height: 200
        id:label5
        y: 180
        Text {
            id: info
            text: qsTr("")
            anchors.centerIn: parent
            y: 200
            font.pixelSize: 64
            color: "white"
        }
    }

    Rectangle {
         id: rect
         function setMax(a,b){
             return Math.max(a, b);
         }
         anchors.centerIn: parent
         Field {
             function setCellWidth(pWidth, num){
                 return(pWidth - (pWidth % num))/num
             }

             id: field2
             anchors.centerIn: parent
             cellWidth: setCellWidth(parent.width, cellsPerRow)
         }
         height: setMax(parent.height,parent.width)-700
         width: height
    }

    Label {
        id: label2
        width: page.width
        height: 200
        y: 950
        Button {
            id: btn1
            Text {
                id: name2
                text: qsTr("Check")
                anchors.centerIn: parent
                font.pixelSize: 48
                color: "black"
            }
            onClicked: field2.check()
            anchors.centerIn: parent
            backgroundColor: "white"
            width: name2.width + 50
        }
    }

    Label {
        id: label4
        width: page.width
        height: 200
        y: 1050
        Button {
            id: btn3
            visible: false
            Text {
                id: name4
                text: qsTr("Next level")
                anchors.centerIn: parent
                font.pixelSize: 48
                color: "black"
            }
            onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
            anchors.centerIn: parent
            backgroundColor: "white"
            width: name3.width + 50
        }
    }

}
