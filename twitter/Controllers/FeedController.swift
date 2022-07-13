import UIKit
import SDWebImage
import FirebaseAuth

class FeedController: UIViewController, ConfigureView {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        }
    }
    
    var tweets = [Tweet]() {
        didSet {
            /* as tweets are fetched in viewDidLoad(), we
             need to reload this data to update tableView */
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
       // tableView.allowsSelection = false
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
        return tableView
    }()
        
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
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.titleView = logoImageView
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logOutButtonPressed))
                
        fetchTweetsFromTweetService()
    }
    
    func viewHierarchy() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchTweetsFromTweetService(){
        TweetService.instance.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
        
    
    // MARK: - Methods
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
extension FeedController: UITableViewDelegate, UITableViewDataSource, TweetCellDelegate {
    // configure number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    // configure cell as TweetCell()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier, for: indexPath) as! TweetCell
        
        cell.delegate = self
        cell.tweet = tweets[indexPath.row] // tweets[0], tweets[1], tweets[2]...
        return cell
    }
    
    // configure cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // when selecting the cell, navigate to TweetController()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweetController = TweetController()
        navigationController?.pushViewController(tweetController, animated: true)
    }
    
    // TweetCellDelegate: when profileImageViewPressed on the cell, navigate to TweetController()
    func profileImageViewPressed() {
        let profileController = ProfileController()
        navigationController?.pushViewController(profileController, animated: true)
    }
}
