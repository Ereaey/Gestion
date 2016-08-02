import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0
import "."

Rectangle {
    //parent.width: 1000
    //parent.height: 1000
    Component.onCompleted:
    {
        windowMain.flags =  Qt.Window
        windowMain.visibility = Qt.WindowFullScreen
        //windowMain.width = 1000
        //windowMain.height = 800
    }
    color: "#F1F3FA"

    TopBar
    {

    }

    SubMenu
    {

    }


    Rectangle
    {
        y:70
        height:1
        color:"#D2D2D2"
        width:parent.width
    }
    Rectangle
    {
        //visible:false
        y:97
        height:parent.height-97
        color:"#364150"
        width:580
        Text
        {
            text: "Séléctionner une communauté"
            font.family: "Trebuchet MS"
            font.bold: true
            font.pointSize: 12
            x: 4
            y: 10
            color: "white"
        }

        Column
        {
            y:35
            Button {
                //x: 5

                label: Text {
                    //color: ""
                    text: "Support Assurance Qualité opérationnelle Sites industriels Valenciennes, Sevelnord et Douvrin-FM"
                    font.family: "Trebuchet MS"
                    //font.italic: true
                    color: accueil2.containsMouse ? "white" : "white"
                    //font.bold: accueil2.containsMouse ? true : false
                    font.pointSize: 9
                    x:12
                    y:7
                    //anchors.centerIn: parent
                    //font.underline: accueil2.containsMouse ? true : false
                    //width:400
                    clip:true
                }
                background: Rectangle {
                    width: 580
                    height: 30
                    opacity: enabled ? 1 : 0.3
                    //color:"#F3F3F3"
                    color: accueil2.containsMouse ? "#3E4B5C" : "#364150"
                    //radius: accueil2.containsMouse ? 5 : 0
                }
                MouseArea
                {
                    id: accueil2
                    anchors.fill: parent
                    hoverEnabled: true
                }
            }
        }
    }

    Rectangle
    {
        y:71
        height:25
        width: parent.width
        x:0
        color: "white"
        Button {
            y: 3
            x: 5

            label: Text {
                //color: ""
                text: "Changer de communauté"
                font.family: "Trebuchet MS"
                //font.italic: true
                color: accueil23.containsMouse ? "white" : "white"
                //font.bold: accueil2.containsMouse ? true : false
                font.pointSize: 9
                x:8
                y:2
                //anchors.centerIn: parent
                //font.underline: accueil2.containsMouse ? true : false
                //width:400
                clip:true
            }
            background: Rectangle {
                width: 155
                height: 20
                opacity: enabled ? 1 : 0.3
                //color:"#F3F3F3"
                color: accueil23.containsMouse ? "#3E4B5C" : "#364150"
                radius: 5
            }
            MouseArea
            {
                id: accueil23
                anchors.fill: parent
                hoverEnabled: true
            }
        }

        Text
        {
            text: "Support Assurance Qualité opérationnelle Sites industriels Valenciennes, Sevelnord et Douvrin-FM > G_H_DEUR (1500 résultats)"
            font.pointSize: 10
            font.family: "Arial"
            font.bold: true
            color: "#6A6666"
            //x: 620
            y: 5
            x: 170
        }
    }
    Rectangle
    {
        y:96
        height:1
        color:"#D2D2D2"
        width:parent.width
    }
    /*
    Rectangle
    {
        y:parent.height-30
        height:30
        width: parent.width
        color: "#282828"
        Text
        {
            text: "Métier Production moteurs Douvrin-FM"
            font.family: "Arial"
            font.bold: true
            font.pointSize: 13
            x: 5
            y: 2
            color: "white"
        }
    }*/
}
