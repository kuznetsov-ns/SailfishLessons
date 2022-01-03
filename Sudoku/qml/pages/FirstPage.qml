import QtQuick 2.0
import Sailfish.Silica 1.0
import "variableLib.js" as Var

Page {
    id: page

    Label {
        width: page.width
        height: 200
        id:label
        Text {
            id: name
            text: qsTr("SUDOKU")
            anchors.centerIn: parent
            font.pixelSize: 64
            color: "white"
        }

    }

    Label {
        y: 200
        Column {
            spacing: 30
            anchors.fill: parent
            anchors.topMargin: 30
            Row {
                spacing: 30
                anchors.left: parent.left
                anchors.margins: 30
                Rectangle {
                    id: r1
                    width: 200
                    height: 200
                    Button {
                        Text {
                            id: name1
                            text: qsTr("1")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        highlightBackgroundColor: "white"
                        onClicked: pageStack.animatorPush(Qt.resolvedUrl("Sudoku.qml"))
                        anchors.centerIn: parent
                        backgroundColor: "white"
                        width: 200
                        height: 200
                    }
                }
                Rectangle {
                    id: r2
                    width: 200
                    height: 200
                    Button {
                        id: btnMM2
                        Text {
                            id: name2
                            text: qsTr("2")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        highlightBackgroundColor: "white"
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        enabled: (Var.unlock === 1 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM2.enabled ? "white" : "gray")
                }
                Rectangle {
                    id: r3
                    width: 200
                    height: 200
                    Button {
                        id: btnMM3
                        Text {
                            id: name3
                            text: qsTr("3")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        enabled: (Var.unlock === 2 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM3.enabled ? "white" : "gray")
                }
            }
            Row {
                spacing: 30
                anchors.left: parent.left
                anchors.margins: 30
                Rectangle {
                    id: r4
                    width: 200
                    height: 200
                    Button {
                        id: btnMM4
                        Text {
                            id: name4
                            text: qsTr("4")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        enabled: (Var.unlock === 3 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM4.enabled ? "white" : "gray")
                }
                Rectangle {
                    id: r5
                    width: 200
                    height: 200
                    Button {
                        id: btnMM5
                        Text {
                            id: name5
                            text: qsTr("5")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        enabled: (Var.unlock === 4 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM5.enabled ? "white" : "gray")
                }
                Rectangle {
                    id: r6
                    width: 200
                    height: 200
                    Button {
                        id: btnMM6
                        Text {
                            id: name6
                            text: qsTr("6")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        enabled: (Var.unlock === 5 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM6.enabled ? "white" : "gray")
                }
            }
            Row {
                spacing: 30
                anchors.left: parent.left
                anchors.margins: 30
                Rectangle {
                    id: r7
                    width: 200
                    height: 200
                    Button {
                        id: btnMM7
                        Text {
                            id: name7
                            text: qsTr("7")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        enabled: (Var.unlock === 6 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM7.enabled ? "white" : "gray")
                }
                Rectangle {
                    id: r8
                    width: 200
                    height: 200
                    Button {
                        id: btnMM8
                        Text {
                            id: name8
                            text: qsTr("8")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        enabled: (Var.unlock === 7 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM8.enabled ? "white" : "gray")
                }
                Rectangle {
                    id: r9
                    width: 200
                    height: 200
                    Button {
                        id: btnMM9
                        Text {
                            id: name9
                            text: qsTr("9")
                            anchors.centerIn: parent
                            font.pixelSize: 48
                            color: "black"
                        }
                        onClicked: pageStack.push(Qt.resolvedUrl("Sudoku1.qml"))
                        anchors.centerIn: parent
                        width: 200
                        height: 200
                        enabled: (Var.unlock === 8 ? true : false)
                        backgroundColor: (enabled ? "white" : "gray")
                    }
                    color: (btnMM9.enabled ? "white" : "gray")
                }
            }
        }
    }

    Label {
        id: auth
        width: page.width
        y: 1160
        x: 400
        Text {
            text: qsTr("Kuznetsov Nikita")
            color: "white"
            font.pixelSize: 42
        }
    }
    Label {
        id: auth1
        width: page.width
        y: 1200
        x: 530
        Text {
            text: qsTr("381806-3")
            color: "white"
            font.pixelSize: 42
        }
    }
}
