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
    let gameSize: CGFloat = 100;
    let windowFrame = NSMakeRect(
      visibleFrame.size.width - gameSize,
      visibleFrame.origin.y,
      gameSize,
      gameSize
    )

    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
