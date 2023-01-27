import Foundation
import FirebaseAuth
import FirebaseDatabase

struct TweetService {
    // MARK: - Properties
    static let instance = TweetService()
    
    // MARK: - Methods
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
        
        REF_DB_TWEETS.observe(.childAdded) { snapshot in
            let tweetID = snapshot.key
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let uid = dictionary["uid"] as? String else { return }
            
            UserService.instance.fetchUser(uid: uid) { user in
                let tweet = Tweet(tweetID: tweetID, dictionary: dictionary, user: user)
                tweets.append(tweet)
                completion(tweets.reversed())
            }
        }
    }
}
