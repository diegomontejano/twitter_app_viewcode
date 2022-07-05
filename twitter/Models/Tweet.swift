import Foundation

struct Tweet {
    let uid: String
    let tweet: String // caption
    let timestamp: Int // Int(NSDate().timeIntervalSince1970)
    let likes: Int
    let retweets: Int
}
