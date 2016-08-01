import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Rectangle {
    property alias mouseArea: mouseArea
    width: parent.width
    height: 40

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Button {
        y: 12
        x: 5

        label: Text {
            text: "Accueil"
            color: accueil.containsMouse ? "#25273C" : "white"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            color: accueil.containsMouse ? "white" : "#25273C"
        }
        MouseArea
        {
            id: accueil
            anchors.fill: parent
            hoverEnabled: true
            //propagateComposedEvents: true
            //onClicked: menu.open()
        }
    }

    Button {
        id: control
        text: "Communautés"
        onClicked: menu.open()
        y: 12
        x: 105

        label: Text {
            text: "Communautés"
            color: dqsd.containsMouse ? "#25273C" : "white"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //border.color: control.pressed ? "#26282a" : "#353637"
            color: dqsd.containsMouse ? "white" : "#25273C"
        }
        MouseArea
        {
            id: dqsd
            anchors.fill: parent
            hoverEnabled: true
            //propagateComposedEvents: true
            onClicked: menu.open()
        }

        Menu {
            id: menu
            y: 28
            x:-45
            MenuItem {
                text: "Rechercher un goal"
            }
            MenuItem {
                text: "Goals vides"
            }
            MenuItem {
                text: "Goals supprimés"
                onTriggered: Qt.quit()
            }

        }
    }

    Button {
        y: 12
        x: 205

        label: Text {
            text: "Utilisateurs"
            color: "white"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //border.color: control.pressed ? "#26282a" : "#353637"
            color: "#25273C"
        }
    }


    Button {
        y: 12
        x: 305

        label: Text {
            text: "Domaines"
            color: "white"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //border.color: control.pressed ? "#26282a" : "#353637"
            color: "#25273C"
        }
    }


    Button {
        y: 12
        x: 405

        label: Text {
            text: "Documents"
            color: "white"
            font.pointSize: 10
            anchors.centerIn: parent
        }
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 15
            opacity: enabled ? 1 : 0.3
            //border.color: control.pressed ? "#26282a" : "#353637"
            color: "#25273C"
        }
    }

    Image
    {
        x: parent.width - 65
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
    }
    color: "#25273C"
}
