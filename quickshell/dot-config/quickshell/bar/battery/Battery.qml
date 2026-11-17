import Quickshell.Services.UPower
import QtQuick

import "../../Style/" as Style

Text {
  font.pixelSize: Style.Font.textSize
  font.family: Style.Font.family
  font.bold: true

  property var battery: UPower.displayDevice

  color: {
    switch (battery.state) {
      case UPowerDeviceState.Charging:
      case UPowerDeviceState.FullyCharged: return Style.Colors.green;
      case UPowerDeviceState.Empty: return Style.Colors.red;
      default: return battery.percentage > 0.20 ? Style.Colors.yellow : Style.Colors.red;
    }
  }

  text: `${Math.floor(battery.percentage * 100)}%`
}
