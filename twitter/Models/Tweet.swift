import Foundation

struct Tweet {
    // MARK: - Properties
    let tweetID: String
    let user: User
    let uid: String
    let tweetText: String
    var tweetTime: Date!
    let tweetLikes: Int
    let tweetRetweets: Int
    
    // MARK: - Constructor
    init(tweetID: String, user: User, dictionary: [String : Any]) {
        self.tweetID = tweetID
        self.user = user
        self.uid = dictionary["uid"] as? String ?? ""
        self.tweetText = dictionary["tweetText"] as? String ?? ""
        if let tweetTime = dictionary["tweetTime"] as? Double {
            self.tweetTime = Date(timeIntervalSince1970: tweetTime)
        }
        self.tweetLikes = dictionary["tweetLikes"] as? Int ?? 0
        self.tweetRetweets = dictionary["tweetRetweets"] as? Int ?? 0
    }
}
