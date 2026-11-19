import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow { //qmllint disable
      id: background

      required property var modelData
      screen: modelData

      anchors { top: true; bottom: true; left: true; right: true }
      color: "transparent"

      WlrLayershell.namespace: "display_manager_background"
      WlrLayershell.layer: WlrLayer.Background
      WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

      exclusionMode: ExclusionMode.Ignore

      BackgroundEffect.blurRegion: Region { item: background.contentItem }

      Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        cache: false

        source: Qt.resolvedUrl("/home/jhamba/.local/state/background")
      }
    }
  }

  PanelWindow { //qmllint disable
    id: overlay
    screen: Quickshell.screens.find(s => s.name === "eDP-1")

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
    WlrLayershell.namespace: "display_manager"

    color: "transparent"

    Rectangle {
      // contains textboxes for entering in username/passwd/desired de/etc.
    }

    Text {
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.topMargin: screen.width / 6

      font.pixelSize: 36
      font.family: "Jetbrains Mono"
      font.bold: true
      color: Qt.color("#a9b1d6")

      text: Qt.formatDateTime(clock.date, "hh:mmap").slice(0, -2)

      SystemClock {
        id: clock
        precision: SystemClock.Minutes
      }
    }
  }

}