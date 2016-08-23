import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Rectangle
{
    visible:false
    id:commus
    height:parent.height
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
