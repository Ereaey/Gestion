import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
//import Qt.labs.controls 1.0
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

    Rectangle
    {
        y:10
        height: 150
        width: parent.width - 50
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
            placeholderText: qsTr("Entrer l'identifiant du domaine")
            style:TextFieldStyle{
            background: Rectangle {
                 implicitWidth: 200
                 implicitHeight: 30
                 color: control.enabled ? "white" : "#353637"
                 border.color: control.enabled ? "#bdbebf" : "transparent"
             }}
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
}
