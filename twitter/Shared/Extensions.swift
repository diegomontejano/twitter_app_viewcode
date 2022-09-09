import UIKit

extension UIColor {
    static func setRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let twitterBlue = UIColor.setRGB(red: 29, green: 161, blue: 242)
    static let lightGray = UIColor.setRGB(red: 240, green: 240, blue: 240)
}

extension String {
    static func timestampFormatter(timestamp: Date) -> String {
        let timestampFormatter = DateComponentsFormatter()
        timestampFormatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        timestampFormatter.maximumUnitCount = 1
        timestampFormatter.unitsStyle = .abbreviated
        let now = Date()
        return timestampFormatter.string(from: timestamp, to: now) ?? "timestamp error"
    }
}
