import Foundation
import FirebaseAuth
import FirebaseDatabase

struct TweetService {
    static let instance = TweetService()
    
    func uploadTweet(tweetText: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let values = [
            "uid": uid,
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
            guard let uid = dictionary["uid"] as? String else { return }
            let tweetID = snapshot.key
            
            UserService.instance.fetchUser(uid: uid) { user in
                let tweet = Tweet(tweetID: tweetID, user: user, dictionary: dictionary)
                tweets.append(tweet)
                completion(tweets)
            }
        }
    }
    
    
}
