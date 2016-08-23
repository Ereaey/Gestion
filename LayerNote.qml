import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Rectangle
{
    //anchors.fill: parent
    width: parent.width
    height: parent.height

    Rectangle
    {
        //anchors.fill: parent
        y:10
        height: parent.height / 2 - 50
        width: parent.width / 2 - 50
        x:20
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "5000 domaines"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 13
            //y: 10
            //x:150
            color: "white"
            width:parent.width / 2 - 40 -10
            //rightPadding:10
        }
        Rectangle
        {
            color:"#516277"
            width:parent.width
            height:parent.height - 30
            y:30
        }
    }

    Rectangle
    {
        y:10
        height: parent.height / 2 - 50
        width: parent.width / 2 - 50
        x:parent.width / 2
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "5000 domaines"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 13
            //y: 10
            //x:150
            color: "white"
            width:parent.width / 2 - 40 -10
            //rightPadding:10
        }
        Rectangle
        {
            color:"#516277"
            width:parent.width
            height:parent.height - 30
            y:30
        }
    }

    Rectangle
    {
        //anchors.fill: parent
        y: parent.height / 2 - 50 + 20
        height: parent.height / 2 - 50
        width: parent.width / 2 - 50
        x:20
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "5000 domaines"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 13
            //y: 10
            //x:150
            color: "white"
            width:parent.width / 2 - 40 -10
            //rightPadding:10
        }
        Rectangle
        {
            color:"#516277"
            width:parent.width
            height:parent.height - 30
            y:30
        }
    }

    Rectangle
    {
        y:parent.height / 2 - 50 + 20
        height: parent.height / 2 - 50
        width: parent.width / 2 - 50
        x:parent.width / 2
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "5000 domaines"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 13
            //y: 10
            //x:150
            color: "white"
            width:parent.width / 2 - 40 -10
            //rightPadding:10
        }
        Rectangle
        {
            color:"#516277"
            width:parent.width
            height:parent.height - 30
            y:30
        }
    }
}
