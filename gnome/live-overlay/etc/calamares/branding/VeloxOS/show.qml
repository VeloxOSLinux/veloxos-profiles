import QtQuick 2.0
import calamares.slideshow 1.0

Presentation
{
    id: presentation

    Timer {
        interval: 8000 // Alle 8 Sekunden das Bild wechseln
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    // --- SLIDE 1: Welcome ---
    Slide {
        Image {
            id: background1
            source: "welcome.png" // Stelle sicher, dass das Bild im Branding-Ordner ist
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            width: parent.width * 0.8
        }
        Text {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20
            text: "Welcome to VeloxOS - Velocity meets Stability."
            color: "#00b0f0"
            font.pixelSize: 20
            font.bold: true
        }
    }

    // --- SLIDE 2: Performance (v3/v4) ---
    Slide {
        Text {
            id: title2
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Maximum Performance"
            color: "#00b0f0"
            font.pixelSize: 24
            font.bold: true
        }
        Text {
            anchors.top: title2.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Optimized for modern CPUs with x86-64-v3 and v4 support.\nExperience a snappier desktop experience like never before."
            color: "white"
            font.pixelSize: 14
        }
    }

    // --- SLIDE 3: Kernel & ZRAM ---
    Slide {
        Text {
            id: title3
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Powered by CachyOS"
            color: "#00b0f0"
            font.pixelSize: 24
            font.bold: true
        }
        Text {
            anchors.top: title3.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Including the highly optimized CachyOS Bore-Kernel\nand pre-configured ZRAM for superior multitasking."
            color: "white"
            font.pixelSize: 14
        }
    }

    // --- SLIDE 4: Gaming ---
    Slide {
        Text {
            id: title4
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Gaming Ready"
            color: "#00b0f0"
            font.pixelSize: 24
            font.bold: true
        }
        Text {
            anchors.top: title4.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Lower latencies and higher FPS.\nVeloxOS is built with gamers and power users in mind."
            color: "white"
            font.pixelSize: 14
        }
    }
}
