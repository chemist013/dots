pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick

Scope {
  id: root

  property url bgPath: Qt.resolvedUrl(Quickshell.env("HOME") + "/.local/state/background")
  property url bgUrl: Qt.resolvedUrl(bgPath)

  Variants {
    model: Quickshell.screens

    PanelWindow { //qmllint disable
      id: background

      required property var modelData
      screen: modelData

      anchors { top: true; bottom: true; left: true; right: true }
      color: "transparent"

      WlrLayershell.namespace: "background"
      WlrLayershell.layer: WlrLayer.Background
      WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

      exclusionMode: ExclusionMode.Ignore

      FileView {
        id: bgFile
        path: root.bgPath
        watchChanges: true

        onFileChanged: { root.bgUrl = Qt.resolvedUrl(root.bgPath + "?v=" + Date.now()) }
      }

      Image {
        id: backgroundImage
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        cache: false

        source: root.bgUrl
      }
    }
  }
}