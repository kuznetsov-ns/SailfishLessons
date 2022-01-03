import QtQuick 2.0

Rectangle {
    height: width
    color: "white"
    border.color: "black"
    property int value: 0
    property bool editable: false
    property string textColor: (editable ? "blue" : "black")
}
