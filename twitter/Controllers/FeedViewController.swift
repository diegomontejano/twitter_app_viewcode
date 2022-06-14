import UIKit

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    private lazy var logoImageView: UIView = {
        let logoImageView = Components().fitImageView(imageName: "twitter-logo")
        return logoImageView
    }()

    
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
