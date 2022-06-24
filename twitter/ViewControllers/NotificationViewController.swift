import UIKit

class NotificationViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    
    // MARK: - ConfigureViewController
    func viewSettings() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
    
    func viewHierarchy() {}
    
    
}
