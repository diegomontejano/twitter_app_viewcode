import UIKit

class NotificationController: UIViewController, ConfigureView {
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
