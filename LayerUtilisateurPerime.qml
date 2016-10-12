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

    Rectangle
    {
        y:10
        height: 70
        width: parent.width - 50
        x:25
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Selectionner la catégorie des utilisateurs périmés"
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

        Row {
            y:40
            x:10
            CheckBox {
                text: qsTr("Modificateur")
                checked: true
                id:modifcheck

                style: CheckBoxStyle {
                        indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                radius: 3
                                border.color: control.activeFocus ? "darkblue" : "gray"
                                border.width: 1
                                Rectangle {
                                    visible: control.checked
                                    color: "#555"
                                    border.color: "#333"
                                    radius: 1
                                    anchors.margins: 4
                                    anchors.fill: parent
                                }
                        }
                        label: Text {
                            x: 0
                            y: 0
                            width: 100
                            height: 20
                            text: modifcheck.text
                            color: "white"
                         }
                    }
                onClicked:
                {
                    lectcheck.checked = false
                    treatment.searchUserPerime(true);
                }
            }
            Rectangle
            {
                width: 20
                height: parent.height
                color: "#516277"
            }

            CheckBox {
                text: qsTr("Lecteur")
                id:lectcheck
                x:200
                style: CheckBoxStyle {
                        indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                radius: 3
                                border.color: control.activeFocus ? "darkblue" : "gray"
                                border.width: 1
                                Rectangle {
                                    visible: control.checked
                                    color: "#555"
                                    border.color: "#333"
                                    radius: 1
                                    anchors.margins: 4
                                    anchors.fill: parent
                                }
                        }
                        label: Text {
                            x: 0
                            y: 0
                            width: 100
                            height: 20
                            text: lectcheck.text
                            color: "white"
                         }
                    }
                onClicked:
                {
                    modifcheck.checked = false
                    treatment.searchUserPerime(false);
                }
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
            text: "Utilisateur doublons"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            color: "white"
        }
    }
    Rectangle
    {
        y:90
        width: parent.width - 50
        height: parent.height - 100
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
                model: autoCompletUser.result
                focus: true
                delegate: contactDelegate
            }
            ListView
            {
                y:5
                maximumFlickVelocity: 100
                x:8
                height: parent.height
                width: parent.width
                id:treeDomaine
                model: treatment.result
                focus: true
                delegate: contactDelegate
            }
            //ScrollBar.vertical: ScrollBar {}
            //clip: true
       }
    }

    Component {
        id: contactDelegateResult
        Item {
            width: 180;
            height: 30
            x:10
            Column {
                Row
                {
                Text {
                    text: '<b>Id:</b> ' + model.modelData.iddomaine + '     <b>Nom:</b> ' + model.modelData.nom
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
                        principalLoader.source = "LayerDomaineSearch.qml"
                        treatment.searchDomaine(model.modelData.iddomaine);
                    }
                }
                }
            }
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
                    text: '<b>Id:</b> ' + model.modelData.iddomaine + '     <b>Nom:</b> ' + model.modelData.nom
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
                        principalLoader.source = "LayerDomaineSearch.qml"
                        treatment.searchDomaine(model.modelData.iddomaine);
                    }
                }
                }
            }
        }
    }
}
