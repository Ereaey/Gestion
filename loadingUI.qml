import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4

Rectangle {
    property variant clickPos: "1,1"
    color:"#25273C"
    property string msgLoad: loading.messageLoading
    onMsgLoadChanged: {
        currentMessage.text = loading.messageLoading
    }
    property string msg: loading.messageLoadingGlobal
    onMsgChanged: {
        globalMessage.text = loading.messageLoadingGlobal
    }
    property string finish: loading.finish
    onFinishChanged: {
        if (loading.finish == true)
            pageLoader.source = "softUI.qml"
    }
    Timer
    {
        interval: 20;
        running: true;
        repeat: true
        onTriggered:
        {
            progress.maximumValue = loading.allSize
            progress.value = loading.currentSize
            //if (progress.maximumValue == progress.value)
            //    pageLoader.source = "softUI.qml"
        }
    }

    Timer
    {
        interval: 20;
        running: true;
        repeat: true
        onTriggered:
        {
            currentMessage.text = loading.messageLoading
        }
    }


    Image
    {
        width: 113
        height: 79
        source:"logo.png"
        x: -10
        y: -10
    }
    Image
    {
        x: 630
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

    Image
    {
        width: 20
        height: 20
        source:"close.png"
        x: 670
        y: 10
        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                Qt.quit()
            }
        }
    }

    AnimatedImage
    {
        source:"progress.gif"
        x: 260
        y: 190
        visible: b.pressed ? 1: 0
    }
    Text
    {
        text: "Gestion des bases documentaires"
        font.family: "Arial"
        font.pointSize: 20
        color: "white"
        x: 150
        y: 150
    }

    ProgressBar
    {
        id: progress
        width: 800
        height: 1
        x: 0
        y: 320
        value: 0
        style: ProgressBarStyle {
            background: Rectangle {
                radius: 2
                color: "#394064"
                border.color: "#394064"
                border.width: 1
                implicitWidth: 200
                implicitHeight: 24
            }
            progress: Rectangle {
                color: "#448AFF"
                border.color: "#448AFF"
            }
        }
    }

    Text
    {
        id: currentMessage
        text: ""
        x: 5
        y: 368
        color: "white"
    }

    Text
    {
        id: globalMessage
        text: ""
        x: 5
        y: 382
        color: "white"

    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        propagateComposedEvents: true
        onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y)
        }

        onPositionChanged: {
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            windowMain.x += delta.x;
            windowMain.y += delta.y;
        }
    }
    Rectangle
    {
        id:paramMenu1
        opacity: 0.6
        color: "black"
        anchors.fill: parent
        visible: false
    }
    Image
    {
        id:paramMenu2
        source:"menu.png"
        x: 200
        y: 100
        visible: false
        Image
        {
            width: 20
            height: 20
            source:"close.png"
            x: 270
            y: 10
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    paramMenu2.visible = false
                    paramMenu1.visible = false
                }
            }
        }
        Column {
            x: 40
            y: 40
            spacing: 5
            Text
            {
                text: "Paramétres du chargement"
                color: "white"
                font.pointSize: 14
            }

            Rectangle
            {
                height: 10
                color: "transparent"
                width: parent.width
            }

            CheckBox {
                text: qsTr("Documents")
                checked: true
                style: CheckBoxStyle
                {
                    label: Text {
                          text: control.text
                          color: "white"
                          //font.pointSize: 12
                      }
                }
            }
            CheckBox {
                text: qsTr("Membres Goals")
                checked: true
                style: CheckBoxStyle
                {
                    label: Text {
                          text: control.text
                          color: "white"
                          //font.pointSize: 12
                      }
                }
            }
            Rectangle
            {
                height: 40
                color: "transparent"
                width: parent.width
            }
            Button
            {
                x: 170
                text: "Valider"
                onClicked:
                {
                    paramMenu2.visible = false
                    paramMenu1.visible = false
                }
            }
        }
    }
    Image
    {
        id:paramMenu3
        source:"menu.png"
        x: 200
        y: 100
        visible: false
        Text
        {
            x: 40
            y: 20
            text: "Erreur lors du chargement"
            color: "red"
            font.pointSize: 14
        }
        Text
        {
            x: 20
            y: 60
            text: "Les fichiers doivent étre présent dans le disque C:"
            color: "white"
            font.pointSize: 9
        }
        Text
        {
            x: 20
            y: 80
            text: "Audits_des_documents_\r\nexternalID\r\ninternalID\r\nPlans_de_communautes_\r\nssl_goal_pressi\r\nssl_membre_pressi"
            color: "white"
            font.pointSize: 9
        }
        Button
        {
            x: 220
            y: 160
            text: "Reesayer"
            onClicked:
            {
                paramMenu1.visible = false
                paramMenu3.visible = false
            }
        }
    }
}
