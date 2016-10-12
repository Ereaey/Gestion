import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
//import Qt.labs.controls 1.0
import QtQuick.Layouts 1.3
import "."

Rectangle {
    Component.onCompleted:
    {
        windowMain.flags =  Qt.Window
        windowMain.visibility = Qt.WindowFullScreen
        windowMain.minimumWidth = 1300
        windowMain.minimumHeight = 800
    }
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
    }
    property string loadResult2: principalLoader.source
    onLoadResult2Changed: {
        console.log(principalLoader.source);
        if (principalLoader.source == "qrc:/LayerNote.qml")
            testArbre.visible = false;
        else
            testArbre.visible = true;
    }
    color: "white"

    TopBar
    {

    }
/*
    SubMenu
    {

    }
*/
    RowLayout
    {
        height: parent.height - 70
        y:70
        x:0
        width:parent.width
        spacing:0

        Rectangle
        {
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            id:testArbre
            visible : false
            color:"#364150"
            width:600
            Rectangle
            {
                anchors.fill: parent
                color: "#364150"
                Rectangle
                {
                    width: parent.width
                    height: parent.height - 100
                    color:"#364150"
                    Rectangle
                    {
                        width: parent.width
                        height: 30
                        color:"#364150"
                        Text
                        {
                            anchors.fill: parent
                            anchors.leftMargin: 5;
                            anchors.topMargin: 5
                            text: treatment.currentAction
                            font.family: "Arial"
                            font.bold: true
                            horizontalAlignment: Text.AlignLeft
                            font.pointSize: 10
                            color: "white"
                            width:parent.width / 2 - 40 -10
                        }
                    }

                    ScrollView
                    {
                        y:30
                        width: parent.width
                        height: parent.height - 30
                        ListView
                        {
                            anchors.fill: parent
                            maximumFlickVelocity: 100
                            id:testTree
                            model: tree.tree
                            focus: true
                            delegate: ItemView{}
                        }
                    }
                }

                Rectangle
                {
                    height: 100
                    width: parent.width
                    y:parent.height-100

                    color:"#516277"
                    Rectangle
                    {
                        height: 1
                        width: parent.width
                        color:"#516277"
                    }
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
                        y:29
                        height:1
                        width: parent.width
                        color:"#516277"
                    }
                    Rectangle
                    {
                        color: "#364150"
                        width:parent.width
                        height:parent.height - 30
                        y:30
                        Text
                        {
                            id:nomDomaine
                            anchors.fill: parent
                            anchors.leftMargin: 5;
                            anchors.topMargin: 5
                            text: "Nom : " + treatment.descriptionResult.nom
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
                            anchors.topMargin: 22
                            text: "Id : " + treatment.descriptionResult.iddomaine
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
                            text: "Responsable : " + treatment.descriptionResult.responsable
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
                        x: parent.width - 220
                        y:5
                        id:control4
                        text: "Voir fiche"
                        height:20
                        style:ButtonStyle{
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 15
                            radius:3
                            opacity: enabled ? 1 : 0.3
                            color: control4.pressed ? (control4.highlighted ? "#585a5c" : "#e4e4e4") : (control4.highlighted ? "#353637" : "#f6f6f6")
                            border.color: control4.pressed ? "#26282a" : "#353637"
                        }
                        label: Text {
                            x: control4.leftPadding
                            y: control4.topPadding
                            width: control4.availableWidth
                            height: control4.availableHeight
                            text: control4.text
                            font: control4font
                            opacity: enabled || highlighted ? 1 : 0.3
                            color: control4.highlighted ? "#ffffff" : (control4.pressed ? "#26282a" : "#353637")
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }}
                        onClicked:
                        {
                            fileSave.open()
                        }
                    }
                    Button
                    {
                        x: parent.width - 110
                        y:5
                        id:control3
                        text: "Exporter plan"
                        height:20
                        style:ButtonStyle{
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
                        }}
                        onClicked:
                        {
                            fileSave.open()
                        }
                    }
                }
            }
        }

        Loader
        {
            source:"LayerNote.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:principalLoader
        }
        CommuMenu
        {
            Layout.fillHeight: true
            id:commus
            Layout.alignment: Qt.AlignRight
        }

    }
 }
