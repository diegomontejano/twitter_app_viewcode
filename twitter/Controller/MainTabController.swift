import UIKit

class MainTabController: UITabBarController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        
        configureViewControllers()
    }
    
    
    // MARK: - Methods
    func configureViewControllers() {
        let feedController = FeedController()
        feedController.tabBarItem.image = UIImage(systemName: "house")
        
        let exploreController = ExploreController()
        exploreController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let notificationController = NotificationController()
        notificationController.tabBarItem.image = UIImage(systemName: "suit.heart")
        
        let conversationsController = ConversationsController()
        conversationsController.tabBarItem.image = UIImage(systemName: "envelope")
        
        // array of UIViewController
        viewControllers = [feedController, exploreController, notificationController, conversationsController]
    }

    
}
