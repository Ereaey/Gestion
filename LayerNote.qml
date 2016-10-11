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
            text: "TABLEAU DE BORD GENERAL - " + treatment.currentCommu
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
                anchors.topMargin: 25
                text: "Nombre de membres : " + note.nbUser
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
                text: "Nombre de domaines : " + note.nbDomaine
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
                text: "Nombre de documents : " + note.nbDocument
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
                text: "Nombre de goals : " + note.nbGoal
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
                text: "Nombre de niveaux : " + note.niveau
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
            text: "DOMAINES"
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
                text: "Nombre de domaines vides : " + note.domaineVide
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
                text: "Nombre de domaines surchargés : " + note.domaineFull
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
                text: "Nombre de domaines asservisseurs : "  + note.domaineAsservisseurs
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
                text: "Nombre de domaines libres, documents synchronisés : "  + note.domaineLibreS
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
                text: "Nombre de domaines libres, documents non synchronisés : "  + note.domaineLibre
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
            text: "DOCUMENTS"
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
                text: "Nombre de C0 : " + note.documentsC0
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
                text: "Nombre de C1 : " + note.documentsC1
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
                text: "Nombre de C2 : " + note.documentsC2
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
                text: "=> Ayant trop d'utilisateurs : " + note.c2t
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
                text: "Nombre de C3 : " + note.documentsC3
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
                text: "=> Ayant trop d'utilisateurs : " + note.c3t
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
                text: "Nombre de C4 : " + note.documentsC4
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
            Text
            {
                anchors.fill: parent
                anchors.leftMargin: 5;
                anchors.topMargin: 205
                text: "Nombre de documents publiés : " + note.documentsP
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
                anchors.topMargin: 225
                text: "Nombre de documents en version de travail : " + note.documentsE
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
                anchors.topMargin: 245
                text: "=> Depuis plus de 6 mois : " + note.doct6mois
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
                anchors.topMargin: 285
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
                anchors.topMargin: 305
                text: "Nombres de documents sans PJ : " + note.documentsSPJ
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
                anchors.topMargin: 325
                text: "Nombres de documents avec + de 50 PJ : " + note.documentsFull
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
        width: parent.width / 3 - 40
        x: (parent.width / 3) * 2 + 20
        color: "#364150"
        radius:2
        Text
        {
            anchors.fill: parent
            anchors.rightMargin: 5;
            anchors.topMargin: 5
            text: "UTILISATEURS"
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
                text: "INDIVIDUS"
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
                text: "Nombre de responsables : " + note.responsable
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
                text: "Nombre de gestionnaires : " + note.gestionnaires
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
                text: "Nombre de propriétaires : " + note.proprietaires
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
                text: "Nombre de utilisateurs nominatifs : " + note.nominatif
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
                anchors.topMargin: 105
                text: "=> Ayant une date dépassée : " + note.usersPerimee
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
                text: "Nombre d'utilisateurs n'appartenant pas à la communauté : " + note.usersAbsent
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
                anchors.topMargin: 165
                text: "GOALS"
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
                anchors.topMargin: 185
                text: "Nombre de goal utilisés : " + note.goals
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
                anchors.topMargin: 205
                text: "Nombre de goal inexistants : " + note.goalsInexistant
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
                anchors.topMargin: 225
                text: "Nombre de goal vides : " + note.goalsVide
                font.family: "Arial"

                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
                color: "white"
                width:parent.width
            }
        }
    }
}
