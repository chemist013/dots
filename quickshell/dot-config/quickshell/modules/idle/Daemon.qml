import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Pam
import QtQuick

Scope {
  Timer {
    id: pamDelay
    interval: 50
    onTriggered: pam.start()
  }

  PamContext {
    id: pam

    Component.onCompleted: pamDelay.start()

    onCompleted: (result) => {
      if (result === PamResult.Success) {
        idleDaemon.locked = false
      } else {
        pamDelay.start()
      }
    }
  }

  WlSessionLock {
    id: idleDaemon
    locked: true

    WlSessionLockSurface {
      id: lockScreen

      Image {
        anchors.fill: parent
        asynchronous: true

        source: "file://home/jhamba/Pictures/Wallpapers/tokyo-arch"
        fillMode: Image.PreserveAspectFit
      }

      TextInput {
        cursorVisible: false
        color: "white"

        echoMode: TextInput.PasswordEchoOnEdit
        passwordCharacter: '\u25CF'
        passwordMaskDelay: 1000
        focus: true

        // onAccepted: {
          // if (text.length > 0 && pam.responseRequired) {
            // pam.respond(text);
          // }
        }
      }
    }
  }
}