import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Style" as Style

Scope {
  id: root

  required property color accentColor;
  required property string icon; // Material Symbols string
  required property double percentage; // 0 < x < 1.0

  PanelWindow { //qmllint disable
    anchors { bottom: true }
    margins { bottom: screen.height / 20 } //qmllint disable
    exclusiveZone: 0
    color: "transparent"

    implicitHeight: 40
    implicitWidth: screen.width / 6 //qmllint disable

    mask: Region {}

    Rectangle {
      anchors { fill: parent }
      radius: height / 2

      color: Style.Colors.backgroundLight
      border {
        color: Style.Colors.cyan
        width: 2
      }

      RowLayout {
        anchors {
          fill: parent
          leftMargin: 13
          rightMargin: 15
        }

        Text {
          color: root.accentColor
          font {
            family: Style.Font.iconFamily
            pixelSize: 24
          }

          text: root.icon
        }

        Rectangle {
          Layout.fillWidth: true
          implicitHeight: 10
          radius: height / 2
          color: Style.Colors.background

          Rectangle {
            anchors {
              left: parent.left
              top: parent.top
              bottom: parent.bottom
            }

            color: root.accentColor

            width: parent.width * root.percentage
            radius: parent.radius
          }
        }
      }
    }
  }
}