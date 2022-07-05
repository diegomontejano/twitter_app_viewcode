import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

let REF_DB = Database.database().reference()
let REF_DB_USERS = REF_DB.child("users")
let REF_DB_TWEETS = REF_DB.child("tweets")

// storage needs an instance on the class
let REF_STORAGE = Storage.storage().reference()
let REF_STORAGE_PROFILE_IMAGES = REF_STORAGE.child("profile_images")
