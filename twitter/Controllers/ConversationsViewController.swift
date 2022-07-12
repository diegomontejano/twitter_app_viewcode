import UIKit

class ConversationsViewController: UIViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - ConfigureView
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Messages"
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods

    
}
