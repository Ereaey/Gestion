import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0
import QtQuick.Dialogs 1.0
import "."

Rectangle
{
    width: parent.width
    height: parent.height

    property string loadResult: treatment.finish
    onLoadResultChanged: {
        testTree.model = tree.tree
    }

    Rectangle
    {
        y:10
        height: 150
        width: parent.width / 2 - 50
        x:25
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Rechercher un domaine"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 13
            color: "white"
            width:parent.width / 2 - 40 -10
        }
        Rectangle
        {
            color:"#516277"
            width:parent.width
            height:parent.height - 30
            y:30
        }

        TextField
        {
            width:parent.width - 20
            height:30
            y:40
            x:10
            id:control
            placeholderText: qsTr("Entrer domaine")
            background: Rectangle {
                 implicitWidth: 200
                 implicitHeight: 30
                 color: control.enabled ? "white" : "#353637"
                 border.color: control.enabled ? "#bdbebf" : "transparent"
             }
            selectByMouse: true
        }

        Button
        {
            width:parent.width - 20
            height:30
            y:80
            x:10
            text: "Rechercher"
            onClicked:
            {
                treatment.searchDomaine(control.text);
            }
        }
    }
    Rectangle
    {
        y:10
        height: 150
        width: parent.width / 2 - 50
        x: parent.width / 2 + 25
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Autocomplétion domaine"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
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
        y:170
        width: parent.width - 50
        height: 25
        x:25
        color: "#364150"
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Arbre de communauté"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            color: "white"
        }
    }
    Rectangle
    {
        y:195
        width: parent.width - 50
        height: parent.height - 205
        x:25
        color: "#516277"

        Flickable
        {
            anchors.fill: parent
            contentHeight: 15000

            ListView
            {
                y:5
                maximumFlickVelocity: 100
                x:8
                height: parent.height
                width: parent.width
                id:testTree
                model: tree.tree
                focus: true
                delegate: ItemView{}
            }
            ScrollBar.vertical: ScrollBar {}
            clip: true
       }
    }

    Component.onCompleted:
    {
        treatment.searchDomaine("");
    }

}
