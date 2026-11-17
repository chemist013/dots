import Quickshell
import "modules/notifications" as Notification
import "modules/background" as Background
import "modules/osd" as Osd
import "bar"

ShellRoot {
  Bar {}
  Notification.Daemon {}
  Background.Daemon {}
  Osd.Daemon {}
}
