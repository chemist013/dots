pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

import "./OsdDisplay.qml"
import "../../Style" as Style

Scope {
  id: root

  property bool visible: false
  property color accentColor;
  property string icon; // Material Symbols string
  property double percentage; // 0 < x < 1.0

  PwObjectTracker {
    objects: [
      Pipewire.defaultAudioSink,
      // Pipewire.defaultAudioSource
    ]
  }

  Scope {
    id: outputVolume

    Timer {
      id: autoHide
      interval: 2000
      onTriggered: root.visible = false
    }

    Connections {
      target: Pipewire.defaultAudioSink?.audio

      function onVolumeChanged() {
        outputVolume.setParams()
        root.visible = true
        autoHide.restart()
      }

      function onMutedChanged() {
        outputVolume.setParams()
        root.visible = true
        autoHide.restart()
      }
    }

    function setParams() {
      root.accentColor = Style.Colors.magenta
      if (Pipewire.defaultAudioSink.audio?.muted) { root.icon = "volume_off"; }
      else {
        let volumeIcons = [ "volume_mute", "volume_down", "volume_up" ]
        root.icon = volumeIcons[ Math.ceil(Pipewire.defaultAudioSink.audio?.volume * 3) - 1 ]
      }
      root.percentage = Pipewire.defaultAudioSink?.audio.volume ?? 0
    }
  }

  Scope {
    id: brightness
    Connections {
      // target: brightnessctl
    }
  }

  LazyLoader {
    active: root.visible

    OsdDisplay {
      accentColor: root.accentColor
      icon: root.icon
      percentage: root.percentage
    }
  }
}