import UIKit

class ExploreViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Explore"
    }
    
    
    // MARK: - Methods
    func viewHierarchy() {
        
    }
    
    
}
