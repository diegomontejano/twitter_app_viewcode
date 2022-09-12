import UIKit
import SDWebImage
import FirebaseAuth

class FeedController: UICollectionViewController, DMConfigureCollectionView {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        }
    }
    
    var tweets = [Tweet]() {
        didSet {
            /* as tweets are fetched in viewDidLoad(), and this var is populated
             AFTER that, we need to reload collectionView to show these data */
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
        
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureCollectionView()
        fetchTweetsFromTweetService()
    }
    

    // MARK: - Methods
    func configureNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.titleView = logoImageView
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logOutButtonPressed))
    }
    
    func configureCollectionView() {
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: TweetCell.identifier)
        collectionView.backgroundColor = .white
    }
    
    func fetchTweetsFromTweetService() {
        TweetService.instance.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
    
    @objc func logOutButtonPressed() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let nav = UINavigationController.init(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
}


// MARK: - Extension
extension FeedController: UICollectionViewDelegateFlowLayout, TweetCellDelegate {
    // configure number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count
    }
    
    // configure cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    // configure cell as TweetCell()
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // send selected tweet in this collection to TweetCell().tweet
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TweetCell.identifier, for: indexPath) as! TweetCell
        
        
        cell.delegate = self // configure TweetCellDelegate
        cell.tweet = tweets[indexPath.row] // tweets[0], tweets[1], tweets[2]...
        return cell
    }
    
    // when tap on the cell, navigate to TweetController()
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tweetController = TweetController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(tweetController, animated: true)
    }

    // when profileImageViewPressed on the cell, run the method from TweetCellDelegate
    func navigateToProfileController() {
        let profileController = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(profileController, animated: true)
    }

    
}


