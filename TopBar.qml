import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Rectangle {
    //property alias mouseArea: mouseArea
    width: parent.width
    height: 40
    Button {
        y:16
        x: 5

        label: Text {
            text: "Accueil"
            color: accueil.containsMouse ? "#2B3643" : "#F3F3F3"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            color: accueil.containsMouse ? "#F3F3F3" : "#2B3643"
            radius: accueil.containsMouse ? 5 : 0
        }
        MouseArea
        {
            id: accueil
            anchors.fill: parent
            hoverEnabled: true
        }
    }

    Button {
        id: control
        y:16
        x: 115

        label: Text {
            text: "Communautés"
            //color: dqsd.containsMouse ? "#2B3643" : "#F3F3F3"
            color:"#2B3643"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //color: dqsd.containsMouse ? "#F3F3F3" : "#2B3643"
            //radius: dqsd.containsMouse ? 5 : 0
            color:"#F3F3F3"
            radius:5

        }
        MouseArea
        {
            id: dqsd
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
        }
    }

    Button {
        y:16
        x: 225

        label: Text {
            text: "Utilisateurs"
            color: "#F3F3F3"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //border.color: control.pressed ? "#26282a" : "#353637"
            color: "#2B3643"
        }
    }


    Button {
        y:16
        x: 335

        label: Text {
            text: "Domaines"
            color: "#F3F3F3"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //border.color: control.pressed ? "#26282a" : "#353637"
            color: "#2B3643"
        }
    }


    Button {
        y:16
        x: 445

        label: Text {
            text: "Documents"
            color: "#F3F3F3"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //border.color: control.pressed ? "#26282a" : "#353637"
            color: "#2B3643"
        }
    }

    Image
    {
        x: parent.width - 25
        y: 10
        source:"param.png"
        width: 20
        height: 20
        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                paramMenu1.visible = true
                paramMenu2.visible = true
            }
        }
    }
/*
    Image
    {
        width: 20
        height: 20
        source:"close.png"
        x: parent.width - 25
        y: 10
        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                Qt.quit()
            }
        }
    }*/
    color: "#2B3643"
}
