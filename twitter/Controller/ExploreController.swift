import UIKit

class ExploreController: UIViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    
    // MARK: - Methods
    func viewSettings() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
    }
    
    func viewHierarchy() {}
    
    
}
