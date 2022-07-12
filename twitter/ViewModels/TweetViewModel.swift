import Foundation

struct TweetViewModel {
    let tweet: Tweet
    
    var profileImageView: URL? {
        return URL(string: tweet.user.profileImageURL)
    }
    var fullName: String {
        return tweet.user.fullName
    }
    var username: String {
        return "@\(tweet.user.username)"
    }
    var tweetTime: String {
        return "• \(String.timestampFormatter(timestamp: tweet.tweetTime))"
    }
    var tweetText: String {
        return tweet.tweetText
    }
    
    
    
}
