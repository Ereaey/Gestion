import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Row{
    y:3
    id: itemView
    Image
    {
        width: 15
        height: 15
        x:3
        source:
        {
            modelData.hasChild? modelData.isOpen ? "down-arrow.png" : "right-arrow.png" : ""
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
        x:3
        Row
        {
        Rectangle
        {
            height:15
            width: 5
            color: "transparent"
        }
        Text{
            text: modelData.content
            font.pointSize: 10
            font.family: "Helvetica"
            color: modelData.isSelect ? "green" : "white"
            MouseArea{
                anchors.fill: parent
                onClicked:
                {
                    console.log(modelData.content)
                    listDomaine.addDomaine(modelData.content, modelData.id);
                }
            }
        }
        Rectangle
        {
            height:15
            width: 5
            color: "transparent"
        }
/*
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
            onClicked:
            {
                console.log(modelData.content)
                listDomaine.addDomaine(modelData.content, "000000");
            }
        }*/
        }
        Loader{
            source: modelData.isOpen ? "TreeItemsList.qml" : "Empty.qml"
        }
    }

}
