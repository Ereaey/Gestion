import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Rectangle {
    width: parent.width
    height: 30
    y:40
    x:0
    color: "#F3F3F3"
    Button {
        //y:3
        x: 5

        label: Text {
            //color: ""
            text: "Rechercher un goal"
            font.family: "Trebuchet MS"
            font.italic: true
            color: accueil2.containsMouse ? "#395B80" : "#505050"
            font.bold: accueil2.containsMouse ? true : false
            font.pointSize: 10

            anchors.centerIn: parent
            //font.underline: accueil2.containsMouse ? true : false
        }
        background: Rectangle {
            //implicitWidth: 100
            //implicitHeight: parent.height
            opacity: enabled ? 1 : 0.3
            color:"#F3F3F3"
            //color: accueil2.containsMouse ? "#395B80" : "#F3F3F3"
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
