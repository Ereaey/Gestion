import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4
import "."

Rectangle {
    //parent.width: 1000
    //parent.height: 1000
    Component.onCompleted:
    {
        windowMain.width = 800
        windowMain.height = 600
        windowMain.visibility = Qt.WindowFullScreen
        windowMain.flags =  Qt.Window | Qt.WindowMinimizeButtonHint
    }
    color: "#2d3546"
    TopBar
    {
        property variant clickPos: "1,1"

        mouseArea.onPressed: {
            if (windowMain.visibility != Qt.WindowFullScreen)
                clickPos  = Qt.point(mouse.x,mouse.y)
        }

        mouseArea.onPositionChanged: {
            if (windowMain.visibility != Qt.WindowFullScreen)
            {
                var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                windowMain.x += delta.x;
                windowMain.y += delta.y;
            }
        }

        mouseArea.onDoubleClicked: {
            if (windowMain.visibility != Qt.WindowFullScreen)
                windowMain.visibility = Qt.WindowFullScreen
            else
                windowMain.visibility = Qt.Window
        }
    }
    Rectangle
    {
        y:parent.height-30
        height:30
        width: parent.width
        color: "#25273C"
    }
}
