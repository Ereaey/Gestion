import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0
import QtQuick.Layouts 1.3
import "."

Rectangle {
    Component.onCompleted:
    {
        windowMain.flags =  Qt.Window
        windowMain.visibility = Qt.WindowFullScreen
        windowMain.minimumWidth = 1000
        windowMain.minimumHeight = 800
    }
    color: "white"

    TopBar
    {

    }

    SubMenu
    {

    }

    RowLayout
    {
        height: parent.height - 107
        y:107
        x:0
        width:parent.width
        spacing:0

        Loader
        {
            source:"LayerNote.qml"
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:principalLoader
        }
        CommuMenu
        {
            Layout.fillHeight: true
            id:commus
            Layout.alignment: Qt.AlignRight
        }

    }
 }
