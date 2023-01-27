import Foundation

struct User {
    // MARK: - Properties
    let uid: String
    let username: String
    let fullName: String
    let email: String
    let profileImageURL: String
    
    // MARK: - Constructor
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
    }
}
