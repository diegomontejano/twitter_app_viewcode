//  Created by Diego Montejano on 23/06/22.
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

let DB_REF = Database.database().reference()
let DB_USERS = DB_REF.child("users")

// storage needs an instance on the class
let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")


