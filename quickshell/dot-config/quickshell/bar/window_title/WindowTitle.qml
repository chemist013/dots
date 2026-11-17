import Quickshell.Hyprland
import QtQuick

import "../../Style" as Style

Text {
  font.pixelSize: Style.Font.textSize
  font.family: Style.Font.family
  font.bold: true
  color: Style.Colors.white

  text: Hyprland.activeToplevel.title
}