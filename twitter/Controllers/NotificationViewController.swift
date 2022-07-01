import UIKit

class NotificationViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Notifications"
    }
    
    
    // MARK: - Methods
    func viewHierarchy() {
        
    }
    
    
}
