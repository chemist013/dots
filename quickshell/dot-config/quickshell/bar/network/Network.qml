import Quickshell
import Quickshell.Networking
import Quickshell.Widgets
import QtQuick

import "../../Style" as Style

WrapperItem {
  id: root

  property var deviceList: Networking.devices
  property var wired: deviceList.values[0]
  property var wireless: deviceList.values[1]

  function wifiIcons(network) {
    let icons = [ "wifi_1_bar", "wifi_2_bar", "android_wifi_3_bar", /* "android_wifi_4_bar" */ ];
    let index = Math.ceil(network.signalStrength * icons.length) - 1;
    return icons[index];
  }

  Text {
    font.pixelSize: Style.Font.textSize
    font.family: Style.Font.iconFamily
    font.bold: true
    color: Style.Colors.cyan

    text: {
      if (root.wired?.hasLink) { return "settings_ethernet"; }
      else if (!root.wireless?.connected) { return "wifi_off"; }
      else { for (const network of root.wireless.networks.values) { if (network?.connected) { return root.wifiIcons(network); } } }
    }

    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton

      onDoubleClicked : (mouse) => { Quickshell.execDetached({ command: ["nm-connection-editor"] }); }
    }
  }
}