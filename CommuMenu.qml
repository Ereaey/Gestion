import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
//import Qt.labs.controls 1.0

Rectangle
{
    visible:false
    id:commus
    height:parent.height
    color:"#364150"
    width:300

    property string loadResult: treatment.finish
    onLoadResultChanged: {
        if (treatment.finish === true)
        {
            listD.model = treatment.commu;
            console.log("Modif");
        }
    }
    Component {
        id: contactDelegate
        Item {
            width: 180;
            height: 70
            x:10

            Column {
                y:10
                Row
                {
                Text {
                    text: '<b>Resultat:</b> ' + model.modelData.result
                    font.family: "Arial"
                    font.pointSize: 10
                    color: "white"
                }
                Rectangle
                {
                    color:"transparent"
                    width:10
                    height:15
                }
                Button
                {
                    id:control
                    text: "Selectionner"
                    height:15
                    style: ButtonStyle{
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 15
                        radius:3
                        opacity: enabled ? 1 : 0.3
                        color: control.pressed ? (control.highlighted ? "#585a5c" : "#e4e4e4") : (control.highlighted ? "#353637" : "#f6f6f6")
                        border.color: control.pressed ? "#26282a" : "#353637"
                    }
                    label: Text {
                        width: control.availableWidth
                        height: control.availableHeight
                        text: control.text
                        opacity: enabled || highlighted ? 1 : 0.3
                        color: control.highlighted ? "#ffffff" : (control.pressed ? "#26282a" : "#353637")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    }
                    onClicked:
                    {
                        treatment.setCommu(model.modelData.nom)
                    }
                }
                }
                Text {
                    text: '<b>Nom:</b> ' + model.modelData.nom
                    font.family: "Arial"
                    font.pointSize: 10
                    color: "white"
                    wrapMode: Text.WrapAnywhere
                    width: 280
                }
            }
        }
    }


    ScrollView
    {
        anchors.fill: parent
        ListView {
            id:listD
            maximumFlickVelocity: 100
            x:30
            height: parent.height - 40
            width: parent.width
            model: treatment.commu
            delegate: contactDelegate
        }
    }
    Component.onCompleted:
    {
        listD.model = treatment.commu;
    }
}
