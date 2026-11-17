import Quickshell.Services.Mpris
import Quickshell.Widgets
import QtQuick

import "../../Style" as Style
import "title_sanitization.js" as TitleSanitizer

WrapperRectangle {
  id: root

  contentInsideBorder: true
  rightMargin: 8
  radius: 16
  color: Style.Colors.green
  visible: text.currentPlayer?.trackTitle !== undefined && text.currentPlayer?.isPlaying

  child: Text {
    id: text

    font {
      pixelSize: Style.Font.textSize
      family: Style.Font.family
      bold: false
    }
    color: Style.Colors.backgroundLight

    property var players: Mpris.players
    property var currentPlayer: players.values[0]
    property string title: ""

    text: " \udb81\udcc7 " + currentPlayer?.trackTitle
    // text: "" + currentPlayer.canPlay + currentPlayer.canPause + currentPlayer.canControl + currentPlayer.canRaise
  }

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton

    onDoubleClicked: (mouse) => {
      text.currentPlayer = text.players.values[(text.players.indexOf(text.currentPlayer) + 1) % text.players.values.length];
    }
  }
}