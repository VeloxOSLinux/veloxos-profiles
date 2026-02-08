import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import io.calamares.ui 1.0

Rectangle {
    id: sideBar
    color: "#0d1117" 
    implicitHeight: 80
    width: parent ? parent.width : 1100 // Fix für den "null" Error

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        spacing: 15

        // Logo mit korrektem dynamischen Pfad
        Image {
            id: logo
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
            fillMode: Image.PreserveAspectFit
            source: "squid.png"
        }

        // Navigations-Repeater
        Repeater {
            model: ViewManager
            
            delegate: Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 35
                Layout.alignment: Qt.AlignVCenter
                radius: 4
                // Prüfen ob dieser Index der aktuelle Schritt ist
                color: (index === ViewManager.currentStepIndex ? "#00b0f0" : "transparent")

                Text {
                    anchors.centerIn: parent
                    text: display // 'display' ist der Name des Moduls
                    color: (index === ViewManager.currentStepIndex ? "#0d1117" : "#ffffff")
                    font.bold: (index === ViewManager.currentStepIndex)
                    font.pixelSize: 13
                    elide: Text.ElideRight
                }
            }
        }
    }
}
