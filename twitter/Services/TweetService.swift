import Foundation
import FirebaseAuth
import FirebaseDatabase

struct TweetService {
    static let instance = TweetService()
    
    func uploadTweet(tweetText: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let values = [
            "uid": uid,
            "tweetID": "",
            "tweetText": tweetText,
            "tweetTime": Int(NSDate().timeIntervalSince1970),
            "tweetLikes": 0,
            "tweetRetweets": 0
            ] as [String: Any]
        
        REF_DB_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }

    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        REF_DB_TWEETS.observe(.childAdded) {snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let tweetID = snapshot.key
            let tweet = Tweet(tweetID: tweetID, dictionary: dictionary)
            tweets.append(tweet)
            completion(tweets)
        }
    }
    
    
}
