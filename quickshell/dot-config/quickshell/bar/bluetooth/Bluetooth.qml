import Quickshell
import Quickshell.Bluetooth
import Quickshell.Widgets
import QtQuick

import "../../Style" as Style
// import Shell.Styles as Style

WrapperItem {
  Text {
    id: root

    font.pixelSize: Style.Font.textSize
    font.family: Style.Font.iconFamily
    font.bold: false
    color: Style.Colors.blue

    property var adapter: Bluetooth.defaultAdapter //qmllint disable

    text: {
      if (!adapter?.enabled) { return "bluetooth_disabled"; }
      else { for (const device of adapter.devices.values) { if (device.connected) { return "bluetooth_connected"; } } }
      return "bluetooth";
    }

    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton | Qt.MiddleButton

      onClicked: (mouse) => { if (mouse.button === Qt.MiddleButton) { root.adapter.enabled = !root.adapter.enabled; } }
      onDoubleClicked: (mouse) => { if (mouse.button === Qt.LeftButton) { Quickshell.execDetached({ command: ["blueman-manager"] }); } }
    }
  }
}