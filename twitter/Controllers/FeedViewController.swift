import UIKit

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    private lazy var logoImageView: UIView = {
        let logoImageView = Components().fitImageView(imageName: "twitter-logo")
        return logoImageView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().userImageView()
        return profileImageView
    }()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
        
    }
    
    
    // MARK: - ConfigureViewController
    func viewSettings() {
        navigationItem.titleView = logoImageView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
    
    func viewHierarchy() {}

    
}
