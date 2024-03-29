import UIKit
import FirebaseAuth

class MainTabBarController: UITabBarController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers[0] as? FeedCollectionViewController else { return }
            feed.user = user
        }
    }
    
    private lazy var tweetButton: UIButton = {
        let tweetButton = Components().roundedButton(buttonName: "plus", width: 56, height: 56, iconMode: true)
        tweetButton.addTarget(self, action: #selector(tweetButtonPressed), for: .touchUpInside)
        return tweetButton
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
    }
        
    // MARK: - Methods
    func authenticateUser() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController.init(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } else {
            fetchUserFromUserService()
            navigationController()
        }
    }
    
    func fetchUserFromUserService() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.instance.fetchUser(uid: uid) { user in
            self.user = user
        }
    }

    func navigationController() {
        let nav1 = configureNavigationController(iconName: "house", title: "Feed", viewController: FeedCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        let nav2 = configureNavigationController(iconName: "magnifyingglass", title: "Explore", viewController: ExploreViewController())
        let nav3 = configureNavigationController(iconName: "suit.heart", title: "Notifications", viewController: NotificationsViewController())
        let nav4 = configureNavigationController(iconName: "envelope", title: "Messages", viewController: MessagesViewController())
        viewControllers = [nav1, nav2, nav3, nav4]
        
        // tweetButton
        view.addSubview(tweetButton)
        NSLayoutConstraint.activate([
            tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tweetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
        ])
    }
    
    func configureNavigationController(iconName: String, title: String, viewController: UIViewController) -> UINavigationController {
        tabBar.backgroundColor = .lightGray
        
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = UIImage(systemName: iconName)
        nav.title = title
        return nav
    }
    
    @objc func tweetButtonPressed() {
        guard let user = user else { return }
        let nav = UINavigationController(rootViewController: AddTweetViewController(user: user))
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}
