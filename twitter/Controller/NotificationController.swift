import UIKit

class NotificationController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    // MARK: - Methods
    func configureView() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
    
    
}
