import UIKit

class NotificationsViewController: UIViewController, DMConfigureView {
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
        view.backgroundColor = .systemBlue
    }
    
    func configureViewConstraints() {
        // code here
    }
}
