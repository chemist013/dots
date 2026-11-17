import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import "battery"
import "bluetooth"
import "clock"
import "media"
import "network"
import "volume"
import "window_title"
import "../Style" as Style

Scope {
  Variants {
    model: Quickshell.screens
    PanelWindow { // qmllint disable
      id: root
      required property var modelData
      screen: modelData

      anchors { left: true; right: true; top: true }
      margins { left: 12; right: 12 } // qmllint disable
      color: "transparent"
      implicitHeight: 26

      WlrLayershell.layer: WlrLayer.Top
      WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
      WlrLayershell.namespace: "top_bar"

      Rectangle {
        anchors.fill: parent
        color: "transparent"

        RowLayout {
          anchors.fill: parent

          RowLayout {
            id: left
            Layout.alignment: Qt.AlignLeft

            Clock {}
            MediaPlayer {}
          }

          RowLayout {
            id: center
            Layout.alignment: Qt.AlignHCenter

            // WindowTitle {}
          }

          RowLayout {
            id: right
            Layout.alignment: Qt.AlignRight

            Bluetooth {}
            Volume {}
            Network {}
            Battery {}
          }
        }
      }
    }
  }
}