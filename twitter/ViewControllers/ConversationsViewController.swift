import UIKit

class ConversationsViewController: UIViewController, ConfigureViewController {
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
        navigationItem.title = "Messages"
    }
    
    func viewHierarchy() {}
    
    
}
