import UIKit

class MainTabController: UITabBarController {
    // MARK: - Properties
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        navigationController()
    }
    
    
    // MARK: - Methods
    func configureUI() {
        // add button as subview
        view.addSubview(button)
        // call anchor method from Extensions.swift
        button.anchor(width: 56, height: 56, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingRight: 16, paddingBottom: 64)
        button.layer.cornerRadius = 56/2
    }
    
    func navigationController() {
        let nav1 = configureNavigationController(iconName: "house", viewController: FeedController() )
        let nav2 = configureNavigationController(iconName: "magnifyingglass", viewController: ExploreController() )
        let nav3 = configureNavigationController(iconName: "suit.heart", viewController: NotificationController() )
        let nav4 = configureNavigationController(iconName: "envelope", viewController: ConversationsController() )
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func configureNavigationController(iconName: String, viewController: UIViewController) -> UINavigationController {
        tabBar.backgroundColor = .lightGray
        
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = UIImage(systemName: iconName)
        nav.navigationBar.backgroundColor = .lightGray
        return nav
    }

    
}
