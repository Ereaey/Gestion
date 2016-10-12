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

    property string loadResult: autoCompletUser.finish
    onLoadResultChanged: {
        if (autoCompletUser.finish == true)
        {
            testTree.model = autoCompletUser.result
            testTree.visible = true;
            treeDomaine.visible = false;
        }
    }

    property string valueUser: ""
    property string idUser: ""
    Timer
    {
        interval: 500;
        running: true;
        repeat: true
        onTriggered:
        {
            if (valueUser != nameUser.text)
            {
                valueUser = nameUser.text
                autoCompletUser.searchUser(nameUser.text);
                testTree.model = autoCompletUser.result
            }
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
            text: "Rechercher un utilisateur"
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
            id:nameUser
            placeholderText: qsTr("Entrer le nom de l'utilisateur")
            style: TextFieldStyle{
            background: Rectangle {
                 implicitWidth: 200
                 implicitHeight: 30
                 color: nameUser.enabled ? "white" : "#353637"
                 border.color: nameUser.enabled ? "#bdbebf" : "transparent"
             }}
            selectByMouse: true
        }

        Row {
            y:80
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
                    responsablecheck.checked = false
                    gestionnairecheck.checked = false
                    propriocheck.checked = false
                    if (responsablecheck.checked === true)
                        treatment.searchUser(idUser, 0);
                    else if (gestionnairecheck.checked === true)
                        treatment.searchUser(idUser, 1);
                    else if (modifcheck.checked === true)
                        treatment.searchUser(idUser, 2);
                    else if (lectcheck.checked === true)
                        treatment.searchUser(idUser, 3);
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
                    responsablecheck.checked = false
                    gestionnairecheck.checked = false
                    propriocheck.checked = false
                    if (responsablecheck.checked === true)
                        treatment.searchUser(idUser, 0);
                    else if (gestionnairecheck.checked === true)
                        treatment.searchUser(idUser, 1);
                    else if (modifcheck.checked === true)
                        treatment.searchUser(idUser, 2);
                    else if (lectcheck.checked === true)
                        treatment.searchUser(idUser, 3);
                }
            }
            Rectangle
            {
                width: 20
                height: parent.height
                color: "#516277"
            }

            CheckBox {
                text: qsTr("Responsable")
                id:responsablecheck
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
                            text: responsablecheck.text
                            color: "white"
                         }
                    }
                onClicked:
                {
                    modifcheck.checked = false
                    lectcheck.checked = false
                    gestionnairecheck.checked = false
                    propriocheck.checked = false
                    if (responsablecheck.checked === true)
                        treatment.searchUser(idUser, 0);
                    else if (gestionnairecheck.checked === true)
                        treatment.searchUser(idUser, 1);
                    else if (modifcheck.checked === true)
                        treatment.searchUser(idUser, 2);
                    else if (lectcheck.checked === true)
                        treatment.searchUser(idUser, 3);
                }
            }
            Rectangle
            {
                width: 20
                height: parent.height
                color: "#516277"
            }

            CheckBox {
                text: qsTr("Gestionnaire")
                id:gestionnairecheck
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
                            text: gestionnairecheck.text
                            color: "white"
                         }
                    }
                onClicked:
                {
                    modifcheck.checked = false
                    responsablecheck.checked = false
                    lectcheck.checked = false
                    propriocheck.checked = false
                    if (responsablecheck.checked === true)
                        treatment.searchUser(idUser, 0);
                    else if (gestionnairecheck.checked === true)
                        treatment.searchUser(idUser, 1);
                    else if (modifcheck.checked === true)
                        treatment.searchUser(idUser, 2);
                    else if (lectcheck.checked === true)
                        treatment.searchUser(idUser, 3);
                }
            }
            Rectangle
            {
                width: 20
                height: parent.height
                color: "#516277"
            }

            CheckBox {
                text: qsTr("Proprietaires")
                id:propriocheck
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
                            text: propriocheck.text
                            color: "white"
                         }
                    }
                onClicked:
                {
                    modifcheck.checked = false
                    responsablecheck.checked = false
                    lectcheck.checked = false
                    gestionnairecheck.checked = false

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
            text: "Utilisateur recherché"
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
                visible:false
                model: treatment.result
                focus: true
                delegate: contactDelegateResult
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
                        //principalLoader.source = "LayerDomaineSearch.qml"
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
                    text: "Selectionner"
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
                        ////principalLoader.source = "LayerDomaineSearch.qml"
                        valueUser = model.modelData.nom;
                        nameUser.text = model.modelData.nom
                        idUser = model.modelData.id
                        if (responsablecheck.checked === true)
                            treatment.searchUser(model.modelData.id, 0);
                        else if (gestionnairecheck.checked === true)
                            treatment.searchUser(model.modelData.id, 1);
                        else if (modifcheck.checked === true)
                            treatment.searchUser(model.modelData.id, 2);
                        else if (lectcheck.checked === true)
                            treatment.searchUser(model.modelData.id, 3);
                        testTree.visible = false;
                        treeDomaine.visible = true;
                    }
                }
                }
            }
        }
    }
    /*
    Component.onCompleted:
    {
        treatment.searchDocument("");
    }*/

}
