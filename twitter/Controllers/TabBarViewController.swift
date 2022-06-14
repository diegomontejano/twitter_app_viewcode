import UIKit

class TabBarViewController: UITabBarController {
    // MARK: - Properties
    let tweetButton: UIButton = {
        let tweetButton = UIButton(type: .system)
        tweetButton.translatesAutoresizingMaskIntoConstraints = false
        tweetButton.tintColor = .white
        tweetButton.backgroundColor = .twitterBlue
        tweetButton.setImage(UIImage(systemName: "plus"), for: .normal)
        tweetButton.layer.cornerRadius = 56/2
        tweetButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return tweetButton
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController()
        viewHierarchy()
    }
    
    
    // MARK: - Methods
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
        print("button pressed")
    }

    
}
