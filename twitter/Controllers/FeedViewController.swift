import UIKit

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    private lazy var logoImageView = Components().logoImageView(imageName: "twitter-logo")

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
        
    }
    
    
    // MARK: - Methods
    func viewSettings() {
        view.backgroundColor = .white
        navigationItem.titleView = logoImageView
    }
    
    func viewHierarchy() {}

    
}
