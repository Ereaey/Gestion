import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4
import "."

Window {
    visible: true

    id: windowMain
    title: qsTr("Logiciel de gestion des bases documentaires")
    width: 700
    height: 400

    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint
    color: "gray"

    Loader {
        id: pageLoader
        anchors.fill: parent
    }

    Component.onCompleted:
    {

        pageLoader.source = "loadingUI.qml"
        loading.load()
    }
}


/*
    Button
    {
        x: 100
        y: 100
        text: "Démarrer"
        id: b
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "white"
                radius: 4
                color: "white"
            }
        }
        visible: b.pressed ? 0: 1

    }
*/
/*
    MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            //Qt.quit();
        }
    }*/


/*
    TopBar {
        property variant clickPos: "1,1"

        mouseArea.onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y)
        }

        mouseArea.onPositionChanged: {
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            window.x += delta.x;
            window.y += delta.y;
        }

        mouseArea.onDoubleClicked: {
            if (window.visibility != Qt.WindowFullScreen)
                window.visibility = Qt.WindowFullScreen
            else
                window.visibility = Qt.Window
        }
    }

*/
