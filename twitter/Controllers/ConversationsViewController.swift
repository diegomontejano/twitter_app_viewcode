import UIKit

class ConversationsViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Messages"
    }
    
    
    // MARK: - Methods
    func viewHierarchy() {
        
    }
    
    
}
