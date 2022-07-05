import Foundation

struct Tweet {
    let uid: String
    let tweetID: String
    let tweetCaption: String
    var timestamp: Date!
    let likes: Int
    let retweets: Int
    
    init(tweetID: String, dictionary: [String : Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.tweetID = tweetID
        self.tweetCaption = dictionary["tweetCaption"] as? String ?? ""
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweets = dictionary["retweets"] as? Int ?? 0
    }
    
}
