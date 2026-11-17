import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick

import "../../Style" as Style

WrapperItem {
  Text {
    id: root

    font.pixelSize: Style.Font.textSize
    font.family: Style.Font.iconFamily
    font.bold: true
    color: Style.Colors.magenta

    property var output: Pipewire.defaultAudioSink?.audio
    property var input: Pipewire.defaultAudioSource

    text: {
      if (output?.muted) { return "volume_off"; }
      let volumeIcons = [ "volume_mute", "volume_down", "volume_up" ]
      return volumeIcons[ Math.ceil(output?.volume * 3) - 1 ]
    }

    PwObjectTracker {
      objects: [
        Pipewire.defaultAudioSink,
        Pipewire.defaultAudioSource,
      ]
    }

    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton | Qt.MiddleButton

      onClicked: (mouse) => {
        if (mouse.button === Qt.MiddleButton) { root.output.muted = !root.output?.muted; }
      }

      onDoubleClicked: (mouse) => {
        if (mouse.button === Qt.LeftButton) { Quickshell.execDetached({ command: ["pavucontrol"] }); }
      }

      onWheel: (wheel) => {
        // TODO: logic out scroll to change volume
      }
    }
  }
}