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

    property string msg: listDomaine.domaines
    onMsgChanged: {
         testD.model = listDomaine.domaines
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
                    Row
                    {
                    Text {
                        text: '<b>Id:</b> ' + model.modelData.iddomaine
                        font.family: "Arial"
                        font.pointSize: 10
                        color: "white"
                    }
                    Rectangle
                    {
                        color:"transparent"
                        width:10
                        height:15
                    }
                    Button
                    {
                        id:control
                        text: "Retirer"
                        height:15
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 15
                            radius:3
                            opacity: enabled ? 1 : 0.3
                            color: control.pressed ? (control.highlighted ? "#585a5c" : "#e4e4e4") : (control.highlighted ? "#353637" : "#f6f6f6")
                            border.color: control.pressed ? "#26282a" : "#353637"
                        }
                        label: Text {
                            x: control.leftPadding
                            y: control.topPadding
                            width: control.availableWidth
                            height: control.availableHeight
                            text: control.text
                            font: control.font
                            opacity: enabled || highlighted ? 1 : 0.3
                            color: control.highlighted ? "#ffffff" : (control.pressed ? "#26282a" : "#353637")
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }
                    Rectangle
                    {
                        color:"transparent"
                        width:10
                        height:15
                    }
                    Button
                    {
                        id:control2
                        text: "Copier"
                        height:15
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 15
                            radius:3
                            opacity: enabled ? 1 : 0.3
                            color: control2.pressed ? (control2.highlighted ? "#585a5c" : "#e4e4e4") : (control2.highlighted ? "#353637" : "#f6f6f6")
                            border.color: control2.pressed ? "#26282a" : "#353637"
                        }
                        label: Text {
                            x: control2.leftPadding
                            y: control2.topPadding
                            width: control2.availableWidth
                            height: control2.availableHeight
                            text: control2.text
                            font: control2.font
                            opacity: enabled || highlighted ? 1 : 0.3
                            color: control2.highlighted ? "#ffffff" : (control2.pressed ? "#26282a" : "#353637")
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }
                    }
                    Text {
                        text: '<b>Nom:</b> ' + model.modelData.nom
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
                id:listD
                y:5
                maximumFlickVelocity: 100
                x:8
                height: parent.height
                width: parent.width
                model: listDomaine.domaines
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
        dataT.drawTree("")
    }

}
