import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0
import "."

Rectangle
{
    //anchors.fill: parent
    width: parent.width
    height: parent.height

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
            text: "Rechercher un goal"
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

        TextField
        {
            width:parent.width - 20
            height:30
            y:40
            x:10
            id:control
            placeholderText: qsTr("Entrer goal")
            background: Rectangle {
                 implicitWidth: 200
                 implicitHeight: 30
                 color: control.enabled ? "white" : "#353637"
                 border.color: control.enabled ? "#bdbebf" : "transparent"
             }

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
                dataT.drawTree(control.text)
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
            text: "Autocomplétion goal"
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
        width: parent.width / 2 - 50
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
        width: parent.width / 2 - 50
        height: parent.height - 205
        x:25
        color: "#516277"

        Flickable
        {
            y:5
            anchors.fill: parent
            contentHeight: 15000
            ListView{
                y:5
                maximumFlickVelocity: 100
                x:8
                //anchors.fill: parent
                id:testTree
                model: tree.tree
                focus: true
                delegate: ItemView{}
                //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                onCurrentIndexChanged: console.log(currentIndex)
            }
            ScrollBar.vertical: ScrollBar {}
            clip: true
       }
    }

    Rectangle
    {
        y:170
        width: parent.width / 2 - 50
        height: 25
        x: parent.width / 2 + 25
        color: "#364150"
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Liste des domaines selectionnés"
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
        width: parent.width / 2 - 50
        height: parent.height - 205
        x: parent.width / 2 + 25
        color: "#516277"
        Component {
            id: contactDelegate
            Item {
                width: 180;
                height: 40
                x:10
                Column {
                    Text {
                        text: '<b>Id:</b> ' + iddomaine
                        font.family: "Arial"
                        font.pointSize: 10
                        color: "white"
                    }
                    Text {
                        text: '<b>Nom:</b> ' + nom
                        font.family: "Arial"
                        font.pointSize: 10
                        color: "white"
                    }
                }
            }
        }

        Flickable
        {
            anchors.fill: parent
            contentHeight: 10000
            ListView {
                anchors.fill: parent
                model: listDomaine
                delegate: contactDelegate
                //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                //focus: true
            }
            ScrollBar.vertical: ScrollBar {}
            clip: true
        }
    }

    Component.onCompleted:
    {
        dataT.drawTree("a")
    }

}
