import UIKit
import SDWebImage
import FirebaseAuth

class FeedCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        }
    }
    
    var tweets = [Tweet]() {
        didSet {
            /* as tweets are fetched in viewDidLoad(), we need
             to reload this collection to update these data */
            collectionView.reloadData()
        }
    }
        
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(width: 32, height: 32)
        return profileImageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = Components().roundedImageView(imageName: "twitter-logo", width: 44, height: 44)
        return logoImageView
    }()
        
    
    // MARK: - ConfigureView
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
    }
    
    func viewSettings() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.titleView = logoImageView
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logOutButtonPressed))
                
        fetchTweetsFromTweetService()
        registerTweetCell()
    }
    
    func fetchTweetsFromTweetService(){
        TweetService.instance.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
    
    func registerTweetCell() {
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: "TweetCell")
        collectionView.backgroundColor = .white
    }
    
    
    // MARK: - Methods
    @objc func logOutButtonPressed() {
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
}


// MARK: - Extensions
extension FeedCollectionViewController {
    // configure cell as TweetCell()
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.row] // tweets[0], tweets[1], tweets[2]...
        return cell
    }
    
    // configure number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count
    }
}

// configure cell size
extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
