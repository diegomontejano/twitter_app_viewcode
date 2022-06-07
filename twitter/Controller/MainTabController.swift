import UIKit

class MainTabController: UITabBarController {
    // MARK: - Properties
    let customButton: UIButton = {
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
        showViewControllers()
    }
    
    // MARK: - Methods
    func configureUI() {
        // set tab bar color
        tabBar.backgroundColor = .white
        // add button as subview
        view.addSubview(customButton)
        // call anchor method from Extensions.swift
        customButton.anchor(width: 56, height: 56, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingRight: 16, paddingBottom: 64)
        // set corner radius (size / 2)
        customButton.layer.cornerRadius = 56/2
    }
    
    func showViewControllers() {
        let nav1 = navigationController(iconName: "house", viewController: FeedController() )
        let nav2 = navigationController(iconName: "magnifyingglass", viewController: ExploreController() )
        let nav3 = navigationController(iconName: "suit.heart", viewController: NotificationController() )
        let nav4 = navigationController(iconName: "envelope", viewController: ConversationsController() )
        
        // array of UIViewController
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func navigationController(iconName: String, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = UIImage(systemName: iconName)
        nav.navigationBar.backgroundColor = .white
        return nav
    }

    
}
