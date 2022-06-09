import UIKit

// MARK: - UIColor
extension UIColor {
    static func setRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let twitterBlue = UIColor.setRGB(red: 29, green: 161, blue: 242)
    static let lightGray = UIColor.setRGB(red: 240, green: 240, blue: 240)
}

// MARK: - UIView
extension UIView {
    func setConstraints(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        top: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        paddingRight: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        paddingLeft: CGFloat = 0
        ) {
        // enable auto layout
        translatesAutoresizingMaskIntoConstraints = false

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
    }
        
    func setCenter(
        view: UIView,
        topAnchor: NSLayoutYAxisAnchor? = nil,
        leftAnchor: NSLayoutXAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        paddingLeft: CGFloat = 0
        ) {
        translatesAutoresizingMaskIntoConstraints = false

        if topAnchor != nil {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

            self.topAnchor.constraint(equalTo: topAnchor!, constant: paddingTop).isActive = true
        }
        else if leftAnchor != nil {
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            self.leftAnchor.constraint(equalTo: leftAnchor!, constant: -paddingLeft).isActive = true
        }
        else {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
    
    
}
