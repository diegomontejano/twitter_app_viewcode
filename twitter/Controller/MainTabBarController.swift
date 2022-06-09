import UIKit

class MainTabBarController: UITabBarController {
    // MARK: - Properties
    let tweetButton: UIButton = {
        let _view = UIButton(type: .system)
        _view.tintColor = .white
        _view.backgroundColor = .twitterBlue
        _view.setImage(UIImage(systemName: "plus"), for: .normal)
        _view.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return _view
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController()
        bodyView()
    }
    
    
    // MARK: - Methods
    func navigationController() {
        let nav1 = configureNavigationController(iconName: "house", viewController: FeedController())
        let nav2 = configureNavigationController(iconName: "magnifyingglass", viewController: ExploreController())
        let nav3 = configureNavigationController(iconName: "suit.heart", viewController: NotificationController())
        let nav4 = configureNavigationController(iconName: "envelope", viewController: ConversationsController())
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func configureNavigationController(iconName: String, viewController: UIViewController) -> UINavigationController {
        tabBar.backgroundColor = .lightGray
        
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = UIImage(systemName: iconName)
        nav.navigationBar.backgroundColor = .lightGray
        return nav
    }
    
    func bodyView() {
        view.addSubview(tweetButton)
        tweetButton.setConstraints(width: 56, height: 56, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingRight: 16, paddingBottom: 64)
        tweetButton.layer.cornerRadius = 56/2
    }
    
    @objc func buttonPressed() {
        print("button pressed")
    }

    
}
