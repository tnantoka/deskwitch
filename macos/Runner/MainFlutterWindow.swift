import Cocoa
import FlutterMacOS

public extension NSView {
  var mouseDownCanMoveWindow: Bool { true }
}

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()

    flutterViewController.backgroundColor = .clear
    self.backgroundColor = .clear
    self.styleMask = [.borderless]
    // self.level = .floating
    let visibleFrame = NSScreen.main!.visibleFrame
    let gameWidth: CGFloat = 100;
    let gameHeight: CGFloat = 150;
    let windowFrame = NSMakeRect(
      visibleFrame.size.width - gameWidth,
      visibleFrame.origin.y,
      gameWidth,
      gameHeight
    )

    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
