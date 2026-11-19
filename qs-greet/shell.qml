import Quickshell
import Quickshell.Services.Greetd
import "LoginScreen.qml"

ShellRoot {
  id: root

  LoginScreen {}

  Greetd.onAuthMessage: (message, error, responseRequired, echoResponse) => {
    if (error) {

    } else {

    }
  }

  Greetd.onAuthFailure: (message) => {

  }

  Greetd.onError: (error) => {

  }

  Greetd.onReadyToLaunch: {}

  Greetd.onLaunch: {}
}