import UIKit

extension UIColor {
    static func setRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let twitterBlue = UIColor.setRGB(red: 29, green: 161, blue: 242)
    static let lightGray = UIColor.setRGB(red: 240, green: 240, blue: 240)
}



//extension UIView {
//    func setConstraints(
//        width: CGFloat? = nil,
//        height: CGFloat? = nil,
//        leading: NSLayoutXAxisAnchor? = nil,
//        trailing: NSLayoutXAxisAnchor? = nil,
//        top: NSLayoutYAxisAnchor? = nil,
//        bottom: NSLayoutYAxisAnchor? = nil,
//        paddingLeading: CGFloat = 0,
//        paddingTrailing: CGFloat = 0,
//        paddingTop: CGFloat = 0,
//        paddingBottom: CGFloat = 0
//        ) {
//        // disable auto-constraints
//        translatesAutoresizingMaskIntoConstraints = false
//
//        if let width = width {
//            widthAnchor.constraint(equalToConstant: width).isActive = true
//        }
//        if let height = height {
//            heightAnchor.constraint(equalToConstant: height).isActive = true
//        }
//        if let leading = leading {
//            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
//        }
//        if let trailing = trailing {
//            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
//        }
//        if let top = top {
//            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
//        }
//        if let bottom = bottom {
//            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
//        }
//    }
//}
