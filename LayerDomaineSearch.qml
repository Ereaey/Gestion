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

    FileDialog {
        id: fileSave
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileSave.fileUrls)
            //listDomaine.exportList();
            treatment.exportPlan(treatment.descriptionResult.iddomaine, fileSave.fileUrls);
        }
        onRejected: {
            console.log("Canceled")
        }
        selectExisting: false
        nameFilters: [ "html(*.html)" ]
        //Component.onCompleted: visible = true
    }

    property string loadResult: treatment.finish
    onLoadResultChanged: {
        testTree.model = tree.tree
        //nomDomaine.text = treatment.descriptionResult.nom
    }

    property string description: treatment.descriptionResult
    onDescriptionChanged: {
        nomDomaine.text = "Nom : " + treatment.descriptionResult.nom
        idDomaine.text = "Id : " + treatment.descriptionResult.iddomaine
        responsableDomaine.text = "Responsable : " + treatment.descriptionResult.responsable
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
            placeholderText: qsTr("Entrer domaine identifiant")
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
            text: "Information Domaine"
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
            Text
            {
                id:nomDomaine
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 5
                text: treatment.descriptionResult.nom
                font.family: "Arial"
                //font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                //y: 10
                //x:150
                color: "white"
                width:parent.width / 2 - 40 -10
                //rightPadding:10
            }
            Text
            {
                id:idDomaine
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 20
                text: treatment.descriptionResult.iddomaine
                font.family: "Arial"
                //font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                //y: 10
                //x:150
                color: "white"
                width:parent.width / 2 - 40 -10
                //rightPadding:10
            }
            Text
            {
                id:responsableDomaine
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 40
                text: treatment.descriptionResult.responsable
                font.family: "Arial"
                //font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                //y:30
                //x:150
                color: "white"
                width:parent.width / 2 - 40 -10
                //rightPadding:10
            }
        }
        Button
        {
            x: parent.width - 110
            y:5
            id:control3
            text: "Exporter plan"
            height:20
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
/*
    Component.onCompleted:
    {
        treatment.searchDomaine("");
    }
*/
}
