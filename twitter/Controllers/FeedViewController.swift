import UIKit

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "twitter-logo-blue")
        logoImage.contentMode = .scaleAspectFit
        return logoImage
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
        navigationItem.titleView = logoImage
    }
    
    func viewHierarchy() {}

    
}
