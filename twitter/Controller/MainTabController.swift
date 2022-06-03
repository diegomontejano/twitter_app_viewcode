import UIKit

class MainTabController: UITabBarController {
    // MARK: Properties
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        showViewControllers()
    }
    
    
    // MARK: Methods
    func showViewControllers() {
        // instance of ViewController
        let feedController = FeedController()
        // embeed ViewController in NavigationController
        let nav1 = navigationController(iconName: "house", rootViewController: feedController)
        
        let exploreController = ExploreController()
        let nav2 = navigationController(iconName: "magnifyingglass", rootViewController: exploreController)
        
        let notificationController = NotificationController()
        let nav3 = navigationController(iconName: "suit.heart", rootViewController: notificationController)
        
        let conversationController = ConversationsController()
        let nav4 = navigationController(iconName: "envelope", rootViewController: conversationController)
        
        // array of UIViewController
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func navigationController(iconName: String, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = UIImage(systemName: iconName)
        nav.navigationBar.backgroundColor = .white
        return nav
    }

    
}
