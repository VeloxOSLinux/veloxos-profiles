import QtQuick 2.0
import calamares.slideshow 1.0

Presentation
{
    id: presentation

    // --- GLOBALER HINTERGRUND (Bleibt während der gesamten Installation sichtbar) ---
    Image {
        id: globalBackground
        source: "background.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        z: -1 // Stellt sicher, dass der Hintergrund hinter den Slides liegt
    }

    Timer {
        interval: 8000 // Alle 8 Sekunden das Bild wechseln
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    // --- SLIDE 1: Welcome ---
    Slide {
        Image {
            id: logoWelcome
            source: "logo.png"       // Dein transparentes VeloxOS Logo
            anchors.centerIn: parent
            width: parent.width * 0.6
            fillMode: Image.PreserveAspectFit
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 30
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
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Maximum Performance"
            color: "#00b0f0"
            font.pixelSize: 28
            font.bold: true
        }
        Text {
            anchors.top: title2.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Optimized for modern CPUs with x86-64-v3 and v4 support.\nExperience a snappier desktop experience like never before."
            color: "white"
            font.pixelSize: 16
            lineHeight: 1.2
        }
    }

    // --- SLIDE 3: Kernel & ZRAM ---
    Slide {
        Text {
            id: title3
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Powered by CachyOS"
            color: "#00b0f0"
            font.pixelSize: 28
            font.bold: true
        }
        Text {
            anchors.top: title3.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Including the highly optimized CachyOS Bore-Kernel\nand pre-configured ZRAM for superior multitasking."
            color: "white"
            font.pixelSize: 16
            lineHeight: 1.2
        }
    }

    // --- SLIDE 4: Gaming ---
    Slide {
        Text {
            id: title4
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Gaming Ready"
            color: "#00b0f0"
            font.pixelSize: 28
            font.bold: true
        }
        Text {
            anchors.top: title4.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Lower latencies and higher FPS.\nVeloxOS is built with gamers and power users in mind."
            color: "white"
            font.pixelSize: 16
            lineHeight: 1.2
        }
    }
}
