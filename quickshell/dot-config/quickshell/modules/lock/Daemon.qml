import Quickshell
import Quickshell.Services.Pam
import QtQuick

Scope {
  id: root

  signal unlocked()
  signal failed()

  property string currentText: ""
  property bool unlockInProgress: false
  property bool showFailure: false

  onCurrentTextChanged: { showFailure = false; }

  function tryUnlock() {
    if (currentText == "") { return; }
    root.unlockInProgress = true;
    pam.start();
  }

  PamContext {
    id: pam

    onPamMessage: {
      if (responseRequired) { respond(root.currentText); }
    }

    onCompleted: (result) => {
      if (result === PamResult.Success) { root.unlocked(); }
      else {
        root.currentText = "";
        root.showFailure = true;
      }
      root.unlockInProgress = false;
    }
  }
}