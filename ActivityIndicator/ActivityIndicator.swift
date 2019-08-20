import Foundation
import UIKit

class ActivityIndicator: NSObject {

    private var window = UIWindow()
    private var rootController = UIViewController()
    private var indicator = UIActivityIndicatorView()
    private var customWindowLevel: CGFloat {
        return UIWindow.Level.statusBar.rawValue * 1.1
    }
    static let shared = ActivityIndicator()

    override init() {
        super.init()
        window.frame = UIScreen.main.bounds
        window.rootViewController = rootController
        window.backgroundColor = UIColor.clear
        window.isUserInteractionEnabled = true
    }

    func show(style: UIActivityIndicatorView.Style) {
        guard window.isHidden else { return }
        indicator.style = style
        window.isHidden = false
        window.windowLevel = UIWindow.Level(rawValue: customWindowLevel)
        let centre = CGPoint(x:UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height/2)
        indicator.center = centre
        rootController.view.backgroundColor = UIColor.clear
        rootController.view?.addSubview(indicator)
        indicator.startAnimating()
    }

    func hide() {
        guard !window.isHidden else { return }
        indicator.stopAnimating()
        window.isHidden = true
        window.windowLevel = UIWindow.Level.normal
    }
}
