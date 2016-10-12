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

    property string loadResult: treatment.finish
    onLoadResultChanged: {
        if (treatment.finish == true)
        {
            testTree.model = treatment.result
        }
    }
    Rectangle
    {
        y:0
        width: parent.width
        height: 25
        x:0
        color: "#364150"
        Text
        {
            anchors.fill: parent
            anchors.leftMargin: 5;
            anchors.topMargin: 5
            text: "Goals problémes"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            color: "white"
        }
    }
    Rectangle
    {
        y:25
        width: parent.width
        height: parent.height - 25
        x:0
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
           // clip: true
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
                    text: '<b>Id:</b> ' + model.modelData.idgoal + '     <b>Nom:</b> ' + model.modelData.nom + '     <b>Etat:</b> ' + model.modelData.problem
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
                    style: ButtonStyle{
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
                        //principalLoader.source = "LayerGoalSearch.qml"
                        treatment.searchGoal(model.modelData.nom, true, true)
                    }
                }
                }
            }
        }
    }

    /*
    Component.onCompleted:
    {
        treatment.searchGoalsProbleme()
        testTree.model = treatment.result
    }*/
}
