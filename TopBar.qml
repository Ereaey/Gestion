import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: root
    property Item currentItem: accueilMenu
    width: parent.width
    height: 70
    Rectangle
    {
        width: parent.width
        height: 40


        Button {
            y:20
            x: 5
            id:accueilMenu
            checkable: true

            style: ButtonStyle{
                background: Rectangle {
                    implicitWidth: 80
                    implicitHeight: 15
                    opacity: enabled ? 1 : 0.3
                    color: root.currentItem == accueilMenu || accueil.containsMouse ? "#F3F3F3" : "#2B3643"
                    radius: root.currentItem == accueilMenu || accueil.containsMouse ? 5 : 0
                }
                label: Text {
                    text: "Accueil"
                    color: root.currentItem == accueilMenu || accueil.containsMouse ? "#2B3643" : "#F3F3F3"
                    font.pointSize: 10
                    //anchors.centerIn: parent
                    x:15
                }

            }
            MouseArea
            {
                id: accueil
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    root.currentItem = parent
                    principalLoader.source = "LayerNote.qml"
                }
            }
        }

        Button {
            y:20
            x: 300
            id:communautesMenu
            style: ButtonStyle{
            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 15
                opacity: enabled ? 1 : 0.3
                color: root.currentItem == communautesMenu|| communautes.containsMouse ? "#F3F3F3" : "#2B3643"
                radius: root.currentItem == communautesMenu || communautes.containsMouse ? 5 : 0
            }
            label: Text {
                text: "Goals"
                color: root.currentItem == communautesMenu || communautes.containsMouse ? "#2B3643" : "#F3F3F3"
                font.pointSize: 10
                //anchors.centerIn: parent
                x:20
            }
            }
            MouseArea
            {
                id: communautes
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: true
                onClicked:
                {
                    treatment.searchGoal("", false, false);
                    principalLoader.source = "LayerGoalSearch.qml"
                    root.currentItem = parent
                }
            }
        }

        Button {
            y:20
            x: 400
            id:utilisateursMenu
            style: ButtonStyle{
            label: Text {
                text: "Utilisateurs"
                color: root.currentItem == utilisateursMenu || utilisateurs.containsMouse ? "#2B3643" : "#F3F3F3"
                font.pointSize: 10
                //anchors.centerIn: parent
                x:3
            }
            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 15
                opacity: enabled ? 1 : 0.3
                color: root.currentItem == utilisateursMenu || utilisateurs.containsMouse ? "#F3F3F3" : "#2B3643"
                radius: root.currentItem == utilisateursMenu || utilisateurs.containsMouse ? 5 : 0
            }
            }
            MouseArea
            {
                id: utilisateurs
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: true
                onClicked:
                {
                    root.currentItem = parent
                    autoCompletUser.searchUser("")
                    principalLoader.source = "LayerUtilisateur.qml"
                }
            }
        }


        Button {
            y:20
            x: 100
            id:domainesMenu
            style: ButtonStyle{
            label: Text {
                text: "Domaines"
                color: root.currentItem == domainesMenu || domaines.containsMouse ? "#2B3643" : "#F3F3F3"
                font.pointSize: 10
                //anchors.centerIn: parent
                x:8
            }
            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 15
                opacity: enabled ? 1 : 0.3
                color: root.currentItem == domainesMenu || domaines.containsMouse ? "#F3F3F3" : "#2B3643"
                radius: root.currentItem == domainesMenu || domaines.containsMouse ? 5 : 0
            }
            }
            MouseArea
            {
                id: domaines
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: true
                onClicked:
                {
                    treatment.searchDomaine("");
                    principalLoader.source = "LayerDomaineSearch.qml"
                    root.currentItem = parent
                }
            }
        }


        Button {
            y:20
            x: 200
            id:documentsMenu
            style: ButtonStyle{
            label: Text {
                text: "Documents"
                color: (root.currentItem === documentsMenu || documents.containsMouse) ? "#2B3643" : "#F3F3F3"
                font.pointSize: 10
                //anchors.centerIn: parent
                x:5
            }
            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 15
                opacity: enabled ? 1 : 0.3
                color: (root.currentItem === documentsMenu || documents.containsMouse) ? "#F3F3F3" : "#2B3643"
                radius: (root.currentItem === documentsMenu || documents.containsMouse) ? 5 : 0
            }
            }
            MouseArea
            {
                id: documents
                anchors.fill: parent
                hoverEnabled: true
                propagateComposedEvents: true
                onClicked:
                {
                    treatment.searchDocument("");
                    principalLoader.source = "LayerDocument.qml"
                    root.currentItem = parent
                }
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
        color: "#2B3643"
    }
    Rectangle
    {
        width: parent.width
        height: 30
        y:40
        x:0
        color: "#F3F3F3"
        Rectangle
        {
            y:30
            height:1
            color:"#D2D2D2"
            width:parent.width
        }
        Button {
            x: 5
            visible:root.currentItem ==communautesMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Rechercher un goal"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil2.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil2.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil2
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    principalLoader.source = "LayerGoalSearch.qml"
                }
            }
        }
        Button {
            x: 155
            visible:root.currentItem ==communautesMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Goals vides"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil25.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil25.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil25
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchGoalsVide();
                    principalLoader.source = "LayerGoalVide.qml"
                }
            }
        }
        Button {
            x: 255
            visible:root.currentItem ==communautesMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Goals problémes"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil26.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil26.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil26
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchGoalsProbleme();
                    principalLoader.source = "LayerGoalInexistant.qml"
                }
            }
        }
        Button {
            x: 5
            visible:root.currentItem ==accueilMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Note globale"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil23.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil23.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil23
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    principalLoader.source = "LayerNote.qml"
                }
            }
        }
        Button {
            x: 5
            visible:root.currentItem ==documentsMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Rechercher des documents"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil28.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil28.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil28
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchDocument("");
                    principalLoader.source = "LayerDocument.qml"
                }
            }
        }
        Button {
            x: 205
            visible:root.currentItem ==documentsMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Documents sans piéces jointes"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil29.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil29.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil29
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchDocumentVide();
                    principalLoader.source = "LayerDocumentVide.qml"
                }
            }
        }
        Button {
            x: 405
            visible:root.currentItem ==documentsMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Documents avec plus de 50 piéces jointes"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil30.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil30.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil30
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchDocumentSurchage();
                    principalLoader.source = "LayerDocumentFull.qml"
                }
            }
        }
        Button {
            x: 5
            visible:root.currentItem ==utilisateursMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Rechercher un utilisateur"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil31.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil31.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil31
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    autoCompletUser.searchUser("")
                    principalLoader.source = "LayerUtilisateur.qml"
                }
            }
        }
        Button {
            x: 175
            visible:root.currentItem ==utilisateursMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Utilisateurs absents de la communauté"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil32.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil32.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil32
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchUserAbsent();
                    principalLoader.source = "LayerUtilisateurAbsent.qml"
                }
            }
        }
        /*
        Button {
            x: 425
            visible:root.currentItem ==utilisateursMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Utilisateurs perimés"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil33.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil33.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil33
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {

                    principalLoader.source = "LayerGoalSearch.qml"
                }
            }
        }*/
        Button {
            x: 5
            visible:root.currentItem ==domainesMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Rechercher un domaine"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil34.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil34.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil34
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchDomaine("");
                    principalLoader.source = "LayerDomaineSearch.qml"
                }
            }
        }
        Button {
            x: 175
            visible:root.currentItem ==domainesMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Domaines vides"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil35.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil35.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil35
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchDomaineVide();
                    principalLoader.source = "LayerDomaineVide.qml"
                }
            }
        }
        Button {
            x: 305
            visible:root.currentItem ==domainesMenu ? true:false
            style: ButtonStyle{
            label: Text {
                text: "Domaines avec plus de 10 documents"
                font.family: "Trebuchet MS"
                font.italic: true

                color: accueil36.containsMouse ? "#395B80" : "#505050"
                font.bold: accueil36.containsMouse ? true : false
                font.pointSize: 10

                anchors.centerIn: parent
            }
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color:"#F3F3F3"
            }
            }
            MouseArea
            {
                id: accueil36
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    treatment.searchDomaineFull();
                    principalLoader.source = "LayerDomaineFull.qml"
                }
            }
        }
    }
}
