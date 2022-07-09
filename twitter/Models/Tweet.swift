import Foundation

struct Tweet {
    let uid: String
    let tweetID: String
    let tweetText: String
    var tweetTime: Date!
    let tweetLikes: Int
    let tweetRetweets: Int
    
    init(tweetID: String, dictionary: [String : Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.tweetID = tweetID
        self.tweetText = dictionary["tweetText"] as? String ?? ""
        if let tweetTime = dictionary["tweetTime"] as? Double {
            self.tweetTime = Date(timeIntervalSince1970: tweetTime)
        }
        self.tweetLikes = dictionary["tweetLikes"] as? Int ?? 0
        self.tweetRetweets = dictionary["tweetRetweets"] as? Int ?? 0
    }
}
