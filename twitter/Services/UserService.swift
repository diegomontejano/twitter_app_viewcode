import Foundation
import FirebaseAuth

struct UserService {
    static let instance = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {        
        REF_DB_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
