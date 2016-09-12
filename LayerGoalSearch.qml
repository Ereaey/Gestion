import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0
import QtQuick.Dialogs 1.0
import "."

Rectangle
{
    FileDialog {
        id: fileSave
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileSave.fileUrls)
            listDomaine.exportList(fileSave.fileUrls);
        }
        onRejected: {
            console.log("Canceled")
        }
        selectExisting: false
        nameFilters: [ "CSV(*.csv)" ]
        //Component.onCompleted: visible = true
    }

    //anchors.fill: parent
    width: parent.width
    height: parent.height

    property string msg: listDomaine.domaines
    onMsgChanged: {
         testD.model = listDomaine.domaines
    }

    property string loadResult: treatment.finish
    onLoadResultChanged: {
        //testD.model = listDomaine.domaines
        console.log("dqsd")
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
            //hovered: true
            //inputMethodComposing: true
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
                if (modifcheck.checkState == Qt.Checked && lectcheck.checkState == Qt.Checked)
                    treatment.searchGoal(control.text, true, true)
                else if (modifcheck.checkState == Qt.Unchecked && lectcheck.checkState == Qt.Checked)
                    treatment.searchGoal(control.text, false, true)
                else if (modifcheck.checkState == Qt.Checked && lectcheck.checkState == Qt.Unchecked)
                    treatment.searchGoal(control.text, true, false)
                else
                    treatment.searchGoal(control.text, false, false)
            }
        }
        Row {
            y:110
            x:5
            CheckBox {
                text: qsTr("Modificateur")
                checked: true
                id:modifcheck
                label: Text {

                    x: 40
                    y: 10
                    width: 100
                    height: 20

                    text: modifcheck.text
                    font: modifcheck.font
                    color: "white"
                    elide: Text.ElideRight
                    visible: modifcheck.text
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                 }
            }
            CheckBox {
                text: qsTr("Lecteur")
                id:lectcheck
                label: Text {

                    x: 40
                    y: 10
                    width: 100
                    height: 20

                    text: lectcheck.text
                    font: lectcheck.font
                    color: "white"
                    elide: Text.ElideRight
                    visible: lectcheck.text
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                 }
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
        Button
        {
            x: parent.width - 220
            y:5
            id:control4
            text: "Vider"
            height:15
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
                font: control4.font
                opacity: enabled || highlighted ? 1 : 0.3
                color: control4.highlighted ? "#ffffff" : (control4.pressed ? "#26282a" : "#353637")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onClicked:
            {
                listDomaine.clear();
            }
        }
        Button
        {
            x: parent.width - 110
            y:5
            id:control3
            text: "Exporter"
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
                        onClicked:
                        {
                            listDomaine.deleteDomaine(model.modelData.iddomaine);
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
                        onClicked:
                        {
                            listDomaine.copy(model.modelData.iddomaine);
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
        //dataT.drawTree("")
        treatment.searchGoal("", true, true)
    }

}
