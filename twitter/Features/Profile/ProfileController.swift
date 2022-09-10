import UIKit

class ProfileController: UITableViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - ConfigureView
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Profile"
        view.backgroundColor = .systemPink
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods
    
    
}
