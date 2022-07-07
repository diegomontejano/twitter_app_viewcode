import UIKit
import SDWebImage
import FirebaseAuth

class FeedCollectionViewController: UICollectionViewController, ConfigureViewController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        }
    }
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(width: 32, height: 32)
        return profileImageView
    }()
        
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.titleView = Components().roundedImageView(imageName: "twitter-logo", width: 44, height: 44)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logOutUser))
                
        // register TweetCell()
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: "TweetCell")
        collectionView.backgroundColor = .white
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods
    @objc func logOutUser() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let nav = UINavigationController.init(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    func fetchTweets(){
        TweetService.instance.fetchTweets { tweets in
            print("DEBUG: tweets are: \(tweets)")
        }
    }
    
}

extension FeedCollectionViewController {
    // show TweetCell() as cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TweetCell", for: indexPath) as! TweetCell
        return cell
    }
    
    // quantity of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
}

// send the size of this view to TweetCell()
extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
