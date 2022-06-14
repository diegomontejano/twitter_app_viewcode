import UIKit

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "twitter-logo-blue")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
