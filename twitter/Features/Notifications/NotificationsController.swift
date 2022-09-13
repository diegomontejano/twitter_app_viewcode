import UIKit

class NotificationsController: UIViewController, DMConfigureView {
    // MARK: - Properties
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureViewConstraints()
    }
        
    
    // MARK: - Methods
    func configureView() {
        navigationItem.title = "Notifications"
    }
    
    func configureViewConstraints() {
        
    }
}
