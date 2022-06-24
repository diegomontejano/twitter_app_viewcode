import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

struct AuthService {
    static let instance = AuthService()
    
    func signUp(profileImage: UIImage, username: String, fullName: String, email: String, password: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let profileImageData = profileImage.jpegData(compressionQuality: 0.2) else { return }
        let storageProfileImagesRef = REF_STORAGE_PROFILE_IMAGES.child( NSUUID().uuidString )
        
        storageProfileImagesRef.putData(profileImageData, metadata: nil) { (meta, error) in
            storageProfileImagesRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    let userValues = [
                        "username": username,
                        "fullName": fullName,
                        "email": email,
                        "profileImageUrl": profileImageUrl
                    ]
                    
                    REF_DB_USERS.child(uid).updateChildValues(userValues, withCompletionBlock: completion)
    
                    
                }
            }
        }
    }
    
    
}
