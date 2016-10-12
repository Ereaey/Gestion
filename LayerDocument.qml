import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
//import Qt.labs.controls 1.0
import QtQuick.Dialogs 1.0
import "."

Rectangle
{
    //anchors.fill: parent
    width: parent.width
    height: parent.height

    property string loadResult: treatment.finish
    onLoadResultChanged: {
        if (treatment.finish == true)
        {
            testTree.model = treatment.result
        }
    }

    Rectangle
    {
        y:10
        height: 120
        width: parent.width - 50
        x:25
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Rechercher un document"
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
            placeholderText: qsTr("Entrer l'id du document")
            style: TextFieldStyle{
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
                treatment.searchDocument(control.text);
            }
        }
    }
    Rectangle
    {
        y:140
        width: parent.width - 50
        height: 25
        x:25
        color: "#364150"
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Documents recherché"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            color: "white"
        }
    }
    Rectangle
    {
        y:165
        width: parent.width - 50
        height: parent.height - 185
        x:25
        color: "#516277"

        ScrollView
        {
            anchors.fill: parent
            //contentHeight: 15000

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
            //ScrollBar.vertical: ScrollBar {}
            //clip: true
       }
    }

    Component {
        id: contactDelegate
        Item {
            width: 180;
            height: 30
            x:10
            Column {
                Row
                {
                Text {
                    text: '<b>Id:</b> ' + model.modelData.id + '     <b>Nom:</b> ' + model.modelData.nom
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
                    style:ButtonStyle{
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
                    }}
                    onClicked:
                    {
                        //listDomaine.deleteDomaine(model.modelData.iddomaine);
                        //principalLoader.source = "LayerDomaineSearch.qml"
                        treatment.searchDomaine(model.modelData.iddomaine);
                    }
                }
                }
            }
        }
    }

    Component.onCompleted:
    {
        treatment.searchDocument("");
    }

}
