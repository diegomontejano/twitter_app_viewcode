import UIKit
import SDWebImage
import FirebaseAuth

class FeedCollectionViewController: UICollectionViewController, DMConfigureCollectionView {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        }
    }
    
    var tweets = [Tweet]() {
        didSet {
            /* as this var is populated AFTER the view appear,
            we need to reload collectionView to show these data */
            collectionView.reloadData()
        }
    }
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(imageName: "twitter-logo-square", width: 32, height: 32)
        return profileImageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = Components().roundedImageView(imageName: "twitter-logo", width: 44, height: 44)
        return logoImageView
    }()
        
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTweetsFromTweetService()
    }
    
    // MARK: - Methods
    func configureNavigationItem() {
        navigationItem.titleView = logoImageView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logOutButtonPressed))
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
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
                let nav = UINavigationController.init(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
}

// MARK: - Extension UICollectionViewDelegateFlowLayout
extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
    // configure cell as FeedCollectionViewCell()
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
        
        cell.delegate = self // configure FeedCollectionViewCellDelegate
        cell.tweet = tweets[indexPath.row] // tweets[0], tweets[1], tweets[2]...
        return cell
    }
    
    // configure number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count
    }
    
    // configure cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    // when tap on the cell body, navigate to TweetCollectionViewController()
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tweetCollectionViewController = TweetCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(tweetCollectionViewController, animated: true)
    }
}

// MARK: - Extension FeedCollectionViewCellDelegate
extension FeedCollectionViewController: FeedCollectionViewCellDelegate {
    // when tap on the cell image, navigate to ProfileCollectionViewController()
    func navigateToProfileCollectionViewController() {
        let profileCollectionViewController = ProfileCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(profileCollectionViewController, animated: true)
    }
}
