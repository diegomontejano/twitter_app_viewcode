import UIKit
import FirebaseAuth

class TabBarController: UITabBarController {
    // MARK: - Properties
    let tweetButton: UIButton = {
        let tweetButton = UIButton(type: .system)
        tweetButton.translatesAutoresizingMaskIntoConstraints = false
        tweetButton.setImage(UIImage(systemName: "plus"), for: .normal)
        tweetButton.tintColor = .white
        tweetButton.backgroundColor = .twitterBlue
        tweetButton.layer.cornerRadius = 56/2
        tweetButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return tweetButton
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
    }
    
    
    // MARK: - Methods
    func fetchUser() {
        UserService.instance.fetchUser()
    }
    
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
    
    func logOutUser() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: log out successfully")
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
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
            tweetButton.widthAnchor.constraint(equalToConstant: 56),
            tweetButton.heightAnchor.constraint(equalToConstant: 56),
            tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tweetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
        ])
    }
    
    @objc func buttonPressed() {
        print("DEBUG: button pressed.")
    }

    
}
