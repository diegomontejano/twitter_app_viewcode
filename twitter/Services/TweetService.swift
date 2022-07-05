import Foundation
import FirebaseAuth
import FirebaseDatabase

struct TweetService {
    static let instance = TweetService()
    
    func uploadTweet(tweet: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let values = [
            "uid": uid,
            "tweet": tweet, // caption
            "timestamp": Int(NSDate().timeIntervalSince1970),
            "likes": 0,
            "retweets": 0
            ] as [String: Any]
        
        REF_DB_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
    
}
