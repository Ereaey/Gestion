import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Rectangle
{
    y:81
    height:26
    width: parent.width
    x:0
    color: "#516277"
    Button {
        y: 3
        x: parent.width - 160

        label: Text {
            text: "Changer de communauté"
            font.family: "Trebuchet MS"
            color: accueil23.containsMouse ? "white" : "white"
            font.pointSize: 9
            x:8
            y:2
            clip:true
        }
        background: Rectangle {
            width: 155
            height: 20
            opacity: enabled ? 1 : 0.3
            color: accueil23.containsMouse ? "#3E4B5C" : "#364150"
            radius: 5
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

    Text
    {
        text: "Support Assurance Qualité opérationnelle Sites industriels Valenciennes, Sevelnord et Douvrin-FM > G_H_DEUR (1500 résultats)"
        font.pointSize: 10
        font.family: "Arial"
        font.bold: true
        color:"white"
        y: 5
        x: 10
    }
    Rectangle
    {
        y:0
        height:1
        color:"#D2D2D2"
        width:parent.width
    }
}

