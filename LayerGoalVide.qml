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
        //if (treatment.finish == true)
            testTree.model = treatment.result
        //testTree.model = tree.tree
    }

    Rectangle
    {
        y:20
        width: parent.width / 2 - 50
        height: 25
        x:25
        color: "#364150"
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Goals vides"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            color: "white"
        }
    }
    Rectangle
    {
        y:45
        width: parent.width / 2 - 50
        height: parent.height - 55
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
                model: treatment.result
                focus: true
                delegate: contactDelegate
            }
            ScrollBar.vertical: ScrollBar {}
            clip: true
       }
    }

    Rectangle
    {
        y:20
        width: parent.width / 2 - 50
        height: 25
        x: parent.width / 2 + 25
        color: "#364150"
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Localisation du goal"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            color: "white"
        }
        Button
        {
            x: parent.width - 150
            y:5
            id:control3
            text: "Via recherche de goal"
            height:15
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 15
                radius:3
                opacity: enabled ? 1 : 0.3
                color: control3.pressed ? (control3.highlighted ? "#585a5c" : "#e4e4e4") : (control3.highlighted ? "#353637" : "#f6f6f6")
                border.color: control3.pressed ? "#26282a" : "#353637"
            }
            label: Text {
                x: control3.leftPadding
                y: control3.topPadding
                width: control3.availableWidth
                height: control3.availableHeight
                text: control3.text
                font: control3.font
                opacity: enabled || highlighted ? 1 : 0.3
                color: control3.highlighted ? "#ffffff" : (control3.pressed ? "#26282a" : "#353637")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onClicked:
            {
                fileSave.open()
            }
        }
    }
    Rectangle
    {
        y:45
        width: parent.width / 2 - 50
        height: parent.height - 55
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
                        text: '<b>Id:</b> ' + model.modelData.idgoal
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
                        text: "Rechercher dans l'arbre"
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
                        onClicked:
                        {
                            listDomaine.deleteDomaine(model.modelData.iddomaine);
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
                //model: listDomaine.domaines
                delegate: contactDelegate
            }
            ScrollBar.vertical: ScrollBar {}
            clip: true
        }
    }

    Component.onCompleted:
    {
        treatment.searchGoalsVide();
        testTree.model = treatment.result
    }
}
