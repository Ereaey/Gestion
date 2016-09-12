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

    flags: Qt.Window | Qt.FramelessWindowHint
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
