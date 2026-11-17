import Quickshell
import QtQuick

import "../../Style" as Style

Text {
  font.pixelSize: Style.Font.textSize
  font.family: Style.Font.family
  font.bold: true
  color: Style.Colors.foreground

  text: Qt.formatDateTime(clock.date, "hh:mmap").slice(0, -2)

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}