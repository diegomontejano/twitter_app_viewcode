import Foundation

struct User {
    let uid: String
    let username: String
    let fullName: String
    let email: String
    let profileImageURL: String
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
    }
}


