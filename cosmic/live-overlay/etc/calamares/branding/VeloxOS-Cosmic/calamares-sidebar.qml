import QtQuick 2.5
import QtQuick.Layouts 1.1

Rectangle {
    id: sidebar
    color: "transparent"
    implicitHeight: 100
    
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 25
        anchors.rightMargin: 25
        spacing: 30

        // Logo Bereich
        Image {
            id: logo
            source: "logo.png"
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
            fillMode: Image.PreserveAspectFit
        }

        // Navigations-Schritte
        Row {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            spacing: 20

            Repeater {
                model: calamares.modules
                
                delegate: Column {
                    spacing: 8
                    opacity: modelData.isCurrent ? 1.0 : 0.6

                    Text {
                        text: modelData.name
                        color: modelData.isCurrent ? "#00b0f0" : "#ffffff"
                        font.pixelSize: 14
                        font.bold: modelData.isCurrent
                        font.family: "Inter, Sans Serif"
                    }

                    // Der Indikator-Strich (Velox-Blau)
                    Rectangle {
                        width: parent.width
                        height: 3
                        color: "#00b0f0"
                        visible: modelData.isCurrent
                        radius: 2
                    }
                }
            }
        }
        
        // About Button (Optional)
        Text {
            text: "VeloxOS v2026.01"
            color: "#444"
            font.pixelSize: 10
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight
            Layout.bottomMargin: 5
        }
    }
}
