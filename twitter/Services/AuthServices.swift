import UIKit
import FirebaseAuth
import FirebaseDatabase

struct AuthService {
    static let instance = AuthService()
    
    func logIn(email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func signUp(profileImage: UIImage, username: String, fullName: String, email: String, password: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        
        guard let profileImageData = profileImage.jpegData(compressionQuality: 0.2) else { return }
        let storageProfileImagesRef = REF_STORAGE_PROFILE_IMAGES.child( NSUUID().uuidString )
        
        storageProfileImagesRef.putData(profileImageData, metadata: nil) { (meta, error) in
            storageProfileImagesRef.downloadURL { (url, error) in
                guard let profileImageURL = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG: \(error.localizedDescription)")
                        return
                    }
                    guard let uid = result?.user.uid else { return }
                    let values = [
                        "username": username,
                        "fullName": fullName,
                        "email": email,
                        "profileImageURL": profileImageURL
                    ]
                    REF_DB_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                }
            }
        }
    }
}
