import UIKit

class NotificationViewController: UIViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - ConfigureView
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Notifications"
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods

    
}
