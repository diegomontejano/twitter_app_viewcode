import UIKit

class ExploreController: UIViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - ConfigureView
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Explore"
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods
    
    
}
