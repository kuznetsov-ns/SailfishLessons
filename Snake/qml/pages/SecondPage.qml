import QtQuick 2.0
import Sailfish.Silica 1.0
import "../snake.js" as Snake


Page {
    id: page

    property int gridWidth: 40
    property int gridHeight: 40
    property int boxWidth: 500 / gridWidth
    property int boxHeight: 500 / gridHeight

    Rectangle {
        id: back

        anchors.fill: parent
        color: '#dfe6e9'
    }

    Label {
        width: page.width
        height: 200
        y: 75
        Text {
            id: gameInfo
            color: "#2d3436"
            text: qsTr("Score: " + Snake.score)
            font.pixelSize: 90
            font.bold: true
            anchors.centerIn: parent
        }
    }

    Item {
        id: game

        width: 500
        height: 500

        anchors.centerIn: parent

        Rectangle {
            id: background
            border.color: "#d63031"
            border.width: 5
            anchors.fill: parent
            color: '#2d3436'
        }

        Item {
            id: snake

            property var parts: [[20, 20], [20, 21], [20, 22], [21, 22], [22, 22]]
            property int dir: Snake.Direction.UP
            property bool canChangeDir: true

            function move() {
                var head = parts[0].slice(0);
                var body = parts;
                body.pop(); // Move body
                Snake.move(head, dir, gridWidth, gridHeight); // Move head
                // Bit itself ?
                if (Snake.posInArray(head, body))
                    return die();
                // Bit the food ?
                if (Snake.checkPos(head, food.pos))
                    eat(body);
                parts = [head].concat(body);
                canChangeDir = true;
            }

            function eat(pos) {
                pos.unshift(food.pos.slice(0));
                Snake.score = Snake.score + 1;
                gameInfo.text = "Score: " + Snake.score;
                food.place();
                gameTimer.interval -= (5 * gameTimer.interval) / 100;
            }

            function die() {
                print('game over');
                upBtn.visible = false;
                dwnBtn.visible = false;
                rghtBtn.visible = false;
                lftBtn.visible = false;
                restartBtn.visible = true;
                gameInfo.text = "Game over :(";
                Snake.score = 0;
                gameTimer.running = false;

            }

            function changeDir(newDir) {
                if (canChangeDir) {
                    if (Snake.OPPOSITES[newDir] !== dir) {
                        dir = newDir;
                        canChangeDir = false;
                    }
                }
            }
        }

        Repeater {
            model: snake.parts

            Rectangle {
                width: boxWidth
                height: boxHeight
                radius: 10
                color: '#d63031'

                Component.onCompleted: {
                    x = Qt.binding(function() { return snake.parts[index][0] * boxWidth; });
                    y = Qt.binding(function() { return snake.parts[index][1] * boxHeight; });
                }
            }
        }

        Rectangle {
            id: food

            color: '#fdcb6e'
            radius: 10
            property var pos
            width: boxWidth
            height: boxHeight

            function place() {
                pos = [Math.floor(Math.random() * gridWidth),
                       Math.floor(Math.random() * gridHeight)];
                x = pos[0] * boxWidth;
                y = pos[1] * boxHeight;
            }

            Component.onCompleted: place()
        }

        Timer {
            id: gameTimer

            interval: 100
            running: true
            repeat: true
            onTriggered: snake.move()
        }
    }
    Label {
        id: restartGame
        height: 200
        width: 400
        y: 1000
        x: page.width/2 - 195
        Button {
            id: restartBtn
            Text {
                text: qsTr("RESTART")
                font.pixelSize: 60
                color: "black"
                font.bold: true
                anchors.centerIn: parent
            }
            highlightBackgroundColor: "white"
            backgroundColor: "white"
            anchors.centerIn: parent
            height: restartGame.height
            width: restartGame.width
            visible: false
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("SecondPage.qml"))
        }
    }

    Label {
        id: mainMenu
        height: 100
        width: 200
        y: 20
        x: page.width/2 - 100
        Button {
            id: mainMenutBtn
            Text {
                text: qsTr("MAIN MENU")
                font.pixelSize: 60
                color: "black"
                anchors.centerIn: parent
                font.bold: true
            }
            highlightBackgroundColor: "white"
            backgroundColor: "white"
            anchors.centerIn: parent
            height: restartGame.height
            width: restartGame.width
            visible: true
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("FirstPage.qml"))
        }
    }

    Label {
        id: up
        height: 100
        width: 100
        y: 1050
        x: page.width/2 - 50
        Button {
            id: upBtn
            Text {
                text: qsTr("↑")
                font.pixelSize: 36
                color: "black"
                font.bold: true
                anchors.centerIn: parent
            }
            highlightBackgroundColor: "white"
            backgroundColor: "white"
            anchors.centerIn: parent
            height: up.height
            width: up.width
            onClicked: snake.dir = Snake.Direction.UP
        }
    }

    Label {
        id: dwn
        height: 100
        width: 100
        y: 1125
        x: page.width/2 - 50
        Button {
            id: dwnBtn
            Text {
                text: qsTr("↓")
                font.pixelSize: 36
                color: "black"
                font.bold: true
                anchors.centerIn: parent
            }
            highlightBackgroundColor: "white"
            backgroundColor: "white"
            anchors.centerIn: parent
            height: dwn.height
            width: dwn.width
            onClicked: snake.dir = Snake.Direction.DOWN
        }
    }

    Label {
        id: rght
        height: 175
        width: 100
        y: 1050
        x: page.width/2 + 48
        Button {
            id: rghtBtn
            Text {
                text: qsTr("→")
                font.pixelSize: 36
                color: "black"
                font.bold: true
                anchors.centerIn: parent
            }
            highlightBackgroundColor: "white"
            backgroundColor: "white"
            anchors.centerIn: parent
            height: rght.height
            width: rght.width
            onClicked: snake.dir = Snake.Direction.RIGHT
        }
    }

    Label {
        id: lft
        height: 175
        width: 100
        y: 1050
        x: page.width/2 - 148
        Button {
            id: lftBtn
            Text {
                text: qsTr("←")
                font.pixelSize: 36
                color: "black"
                font.bold: true
                anchors.centerIn: parent
            }
            highlightBackgroundColor: "white"
            backgroundColor: "white"
            anchors.centerIn: parent
            height: lft.height
            width: lft.width
            onClicked: snake.dir = Snake.Direction.LEFT
        }
    }
}
