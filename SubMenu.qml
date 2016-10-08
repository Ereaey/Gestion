import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
//import Qt.labs.controls 1.0

Rectangle
{

    property string msg: treatment.currentCommu
    onMsgChanged: {
        console.log("test1")
        menuCommu.text = treatment.currentCommu + " > " + treatment.currentAction
    }
    property string msg2: treatment.currentAction
    onMsg2Changed: {
        console.log("test2")
        menuCommu.text = treatment.currentCommu + " > " + treatment.currentAction
    }

    y:81
    height:26
    width: parent.width
    x:0
    color: "#516277"

    Text
    {
        text: treatment.currentCommu + " > recherche en cours"
        font.pointSize: 10
        font.family: "Arial"
        font.bold: true
        color:"white"
        id: menuCommu
        y: 5
        x: 10
    }/*
    Rectangle
    {
        y:0
        height:1
        color:"#D2D2D2"
       width:parent.width
    }*/
    Button {
        y: 1
        x: parent.width - 168
        style: ButtonStyle{

        label: Text {
            text: "Changer de communauté"
            font.family: "Trebuchet MS"
            color: accueil23.containsMouse ? "white" : "white"
            font.pointSize: 9
            x:15
            //y:3
            //clip:true
        }
        background: Rectangle {
            implicitWidth: 170
            implicitHeight: 16
            opacity: enabled ? 1 : 0.3
            color: accueil23.containsMouse ? "#3E4B5C" : "#364150"
            //radius: 5
        }
        }
        MouseArea
        {
            id: accueil23
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                commus.visible = !commus.visible
            }
        }
    }
}

