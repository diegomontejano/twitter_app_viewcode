import Foundation

struct TweetViewModel {
    // MARK: - Properties
    let tweet: Tweet
    let user: User
    
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
    
    
    // MARK: - Constructor
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
