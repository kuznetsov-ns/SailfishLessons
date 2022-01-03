import QtQuick 2.0
import Sailfish.Silica 1.0
import "variableLib.js" as Var

Rectangle {
    id: field1
    property int cellsPerRow: 9
    property int cellsPerCol: cellsPerRow
    property int cellWidth: 100
    property int cellBorderWidth : 1
    property variant puzzle: [
        0,6,0, 5,8,4, 9,0,0,
        5,4,7, 2,0,9, 3,6,0,
        8,0,1, 7,6,0, 2,0,5,

        2,7,8, 0,4,0, 1,0,9,
        0,5,9, 3,2,0, 4,8,9,
        6,3,4, 8,9,0, 0,7,2,

        7,8,0, 1,0,2, 0,9,0,
        0,1,6, 0,5,8, 7,2,3,
        9,0,3, 4,0,6, 8,5,0
    ]
    property variant solution: [
        3,6,2, 5,8,4, 9,1,7,
        5,4,7, 2,1,9, 3,6,8,
        8,9,1, 7,6,0, 2,4,5,

        2,7,8, 6,4,5, 1,3,9,
        1,5,9, 3,2,7, 4,8,9,
        6,3,4, 8,9,1, 5,7,2,

        7,8,5, 1,3,2, 6,9,4,
        4,1,6, 9,5,8, 7,2,3,
        9,2,3, 4,7,6, 8,5,1
    ]

    width: cellWidth * cellsPerRow
    height: cellWidth * cellsPerCol

    Column {

        Repeater {
            model: cellsPerRow
            Row {
                property int rowIndex: index
                Repeater {
                    model: cellsPerCol
                    Cell {
                        property int columnIndex: index
                        id: cell
                        width: field1.cellWidth
                        border.width: field1.cellBorderWidth
                        x: 0
                        y: 0
                        value: puzzle[rowIndex * 9 + columnIndex]
                        editable: (puzzle[rowIndex * 9 + columnIndex] === 0 ? true : false)
                        function changeNumber(flag){
                            if(flag)
                                value = (value + 1) % 10;
                                puzzle[rowIndex * 9 + columnIndex] = value;
                        }

                        Text {
                            function setText(value){
                                if(value === 0) return "";
                                if(value < 0) return "1";
                                if(value > 9) return "9";
                                return value.toString();
                            }

                            anchors.centerIn: parent
                            text: setText(parent.value)
                            color: parent.textColor
                            font.pixelSize: 32
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: parent.changeNumber(parent.editable)
                        }
                    }
                }
            }
        }

    }

    Rectangle {
        x:parent.cellWidth * 3
        height: parent.height
        width: parent.cellBorderWidth * 5
        color: "black"
    }
    Rectangle {
        x: parent.cellWidth * 6
        width: parent.cellBorderWidth * 5
        height: parent.height
        color: "black"
    }
    Rectangle {
        y: parent.cellWidth * 3
        width: parent.width
        height: parent.cellBorderWidth * 5
        color: "black"
    }
    Rectangle {
        y: parent.cellWidth * 6
        width: parent.width
        height: parent.cellBorderWidth * 5
        color: "black"
    }

    function check(){
        var k = 0;
        for(var i = 0; i < 9; i++){
            for(var j = 0; j < 9; j++){
                if(puzzle[i*9+j] === solution[i*9+j]){
                    k++;
                }
                console.log(k)
            }
        }
        if(k == 81){
            //console.log("Winner");
            info.text = qsTr("Winner");
            info.color = "white";
            info.font.bold = true;
            btn3.visible = true;
            Var.unlock = 2;
        }else{
            //console.log("Try Again :(");
            info.text = qsTr("Try Again :(");
        }
    }

}
