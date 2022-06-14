import UIKit

class NotificationController: UIViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    
    // MARK: - Methods
    func viewSettings() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
    
    func viewHierarchy() {}
    
    
}
