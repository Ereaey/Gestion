import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
//import Qt.labs.controls 1.0

Rectangle
{
    //anchors.fill: parent
    width: parent.width
    height: parent.height

    Rectangle
    {
        //anchors.fill: parent
        y:10
        height: 200
        width: parent.width  - 40
        x:20
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "Tableau de bord général - " + treatment.currentCommu
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignRight
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
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 25
                text: "Nombre de membres : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 45
                text: "Nombre de domaines : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 65
                text: "Nombre de documents : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 85
                text: "Nombre de goals : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 105
                text: "Nombre de niveaux : "
                font.family: "Arial"
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
        }
    }

    Rectangle
    {
        //anchors.fill: parent
        y: 220
        height: parent.height - 230
        width: (parent.width / 3) - 26
        x:20
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "Domaines"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
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
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 5
                text: "REPARTITION"
                font.family: "Arial"
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 25
                text: "Nombre de domaines vides : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 45
                text: "Nombre de domaines surchargés : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }

            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 85
                text: "ASSERVISSEMENT"
                font.family: "Arial"
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 105
                text: "Nombre de domaines asservisseurs : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 125
                text: "Nombre de domaines libres, documents synchronisés : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 145
                text: "Nombre de domaines libres, documents non synchronisés : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
        }
    }

    Rectangle
    {
        y: 220
        height: parent.height - 230
        width: (parent.width / 3) - 26
        x:parent.width / 3 + 20
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "Documents"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
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
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 5
                text: "CONFIDENTIALITE"
                font.family: "Arial"
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 25
                text: "Nombre de C0 : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 45
                text: "Nombre de C1 : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 65
                text: "Nombre de C2 : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 25;
                anchors.topMargin: 85
                text: "-> Ayant trop d'utilisateurs :"
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 105
                text: "Nombre de C3 : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 25;
                anchors.topMargin: 125
                text: "-> Ayant trop d'utilisateurs :"
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 145
                text: "Nombre de C4 : "
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 185
                text: "VERSIONNEMENT"
                font.family: "Arial"
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }

        }
    }

    Rectangle
    {
        y: 220
        height: parent.height - 230
        width: parent.width / 3 - 40
        x: (parent.width / 3) * 2 + 20
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "Utilisateurs"
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
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
}
