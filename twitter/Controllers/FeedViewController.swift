import UIKit

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "twitter-logo-blue")
        logoImageView.contentMode = .scaleAspectFit
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
