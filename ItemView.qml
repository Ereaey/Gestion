import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Row{
    id: itemView
    Text{
        width: 15
        height: 11
        text:
        {
            x:3
            color:"white"
            modelData.hasChild? modelData.isOpen ? "-" : "+" : ""
        }
        MouseArea{
            anchors.fill: parent
            onClicked:
            {
                modelData.isOpen = !modelData.isOpen;
            }
        }
    }
    Column{
        Row
        {
        Text{
            text: modelData.content
            font.pointSize: 11
            font.family: "Arial"
            //font.bold: true
            color: modelData.isSelect ? "green" : "white"
            MouseArea{
                anchors.fill: parent
                onClicked:
                {
                    console.log(modelData.content)
                }
            }
        }
        Rectangle
        {
            height:15
            width: 5
            color: "transparent"
        }

        Button
        {
            x:2
            text: "Ajouter"
            width: 100
            height:15
            id:control
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 15
                radius:3
                opacity: enabled ? 1 : 0.3
                color: control.pressed ? (control.highlighted ? "#585a5c" : "#e4e4e4") : (control.highlighted ? "#353637" : "#f6f6f6")
                border.color: control.pressed ? "#26282a" : "#353637"
            }
            label: Text {
                x: control.leftPadding
                y: control.topPadding
                width: control.availableWidth
                height: control.availableHeight
                text: control.text
                font: control.font
                opacity: enabled || highlighted ? 1 : 0.3
                color: control.highlighted ? "#ffffff" : (control.pressed ? "#26282a" : "#353637")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

        }
        }
        Loader{
            source: modelData.isOpen ? "TreeItemsList.qml" : "Empty.qml"
        }
    }

}
