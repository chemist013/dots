import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import "../../Style" as Style
// import qs.Style

Scope {
  id: root

  NotificationServer {
    id: server
    actionIconsSupported: true
    imageSupported: true
    keepOnReload: true

    onNotification: n => n.tracked = true
  }

  PanelWindow { // qmllint disable
    id: list
    anchors { top: true; right: true }
    margins { top: 26; right: 1 } // qmllint disable
    implicitWidth: 300
    implicitHeight: Math.max(1, column.implicitHeight)
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore

    ColumnLayout {
      id: column
      width: parent.width
      spacing: 5

      Repeater {
        model: server.trackedNotifications
        delegate: Rectangle {
          id: card
          required property var modelData

          Timer {
            running: true // notificationCard.modelData.urgency !== NotificationUrgency.Critical
            interval: 5000
            onTriggered: card.modelData.dismiss()
          }

          Layout.fillWidth: true
          Layout.preferredHeight: layout.implicitHeight + 20
          radius: 8
          color: Style.Colors.backgroundLight
          border.width: 2
          border.color: {
            switch (modelData.urgency) {
              case NotificationUrgency.Critical: return Style.Colors.red
              case NotificationUrgency.Low: return Style.Colors.lightGrey
              default: return Style.Colors.cyan
            }
          }

          RowLayout {
            id: layout
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            IconImage {
              implicitSize: 36
              Layout.alignment: Qt.AlignTop
              visible: source.toString() !== ""
              source: card.modelData.image || card.modelData.appIcon || ""
            }

            ColumnLayout {
              Layout.fillWidth: true
              spacing: 2

              Text {
                Layout.fillWidth: true
                text: card.modelData.summary
                color: Style.Colors.blue
                font.family: Style.Font.family
                font.pixelSize: Style.Font.textSize
                font.bold: true
                elide: Text.ElideRight
              }

              Text {
                Layout.fillWidth: true
                visible: text !== ""
                text: card.modelData.body
                color: Style.Colors.foreground
                font.family: Style.Font.family
                font.pixelSize: Style.Font.textSize - 1
                wrapMode: Text.WordWrap
              }
            }
          }

          MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: card.modelData.dismiss()
          }
        }
      }
    }
  }

  Connections {
    id: reloadPopup
    target: Quickshell

    function onReloadCompleted() {
      Quickshell.inhibitReloadPopup();
      Quickshell.execDetached({ command: [ "notify-send", "Conifg Reloaded", "--icon=org.quickshell", "--urgency=low" ] });
    }
    function onReloadFailed(errorString) {
      Quickshell.inhibitReloadPopup();
      Quickshell.execDetached({ command: [ "notify-send", "Conifg Reload Failed", errorString, "--icon=org.quickshell", "--urgency=critical" ] });
    }
  }
}
