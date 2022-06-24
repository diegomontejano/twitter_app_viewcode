import UIKit

class ExploreViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    
    // MARK: - ConfigureViewController
    func viewSettings() {
        navigationItem.title = "Explore"
    }
    
    func viewHierarchy() {}
    
    
}
