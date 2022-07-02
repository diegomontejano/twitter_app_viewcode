import UIKit
import FirebaseAuth

class MainTabBarController: UITabBarController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers[0] as? FeedViewController else { return }
            feed.user = user
        }
    }
    private let tweetButton: UIButton = {
        let tweetButton = Components().roundedButton(title: "plus", fontSize: 40, width: 56, hight: 56, iconMode: true)
        tweetButton.addTarget(self, action: #selector(tweetButtonPressed), for: .touchUpInside)
        return tweetButton
    }()
    
    
    // MARK: - Lifecycle
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
            navigationController()
            viewHierarchy()
            fetchUser()
        }
    }
        
    func fetchUser() {
        UserService.instance.fetchUser { user in
            self.user = user
        }
    }
        
    func navigationController() {
        let nav1 = configureNavigationController(iconName: "house", viewController: FeedViewController())
        let nav2 = configureNavigationController(iconName: "magnifyingglass", viewController: ExploreViewController())
        let nav3 = configureNavigationController(iconName: "suit.heart", viewController: NotificationViewController())
        let nav4 = configureNavigationController(iconName: "envelope", viewController: ConversationsViewController())
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func configureNavigationController(iconName: String, viewController: UIViewController) -> UINavigationController {
        tabBar.backgroundColor = .lightGray
        
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = UIImage(systemName: iconName)
        nav.navigationBar.backgroundColor = .lightGray
        return nav
    }
        
    func viewHierarchy() {
        view.addSubview(tweetButton)
        NSLayoutConstraint.activate([
            tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tweetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
        ])
    }
    
    @objc func tweetButtonPressed() {
        let nav = UINavigationController(rootViewController: UploadTweetViewController())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }

    
}
