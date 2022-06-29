import UIKit
import SDWebImage

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            
            var profileImageView = UIImageView()
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
            profileImageView.layer.masksToBounds =  true
            profileImageView.layer.cornerRadius = 32 / 2
            NSLayoutConstraint.activate([
                profileImageView.widthAnchor.constraint(equalToConstant: 32),
                profileImageView.heightAnchor.constraint(equalToConstant: 32)
            ])
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        }
    }
    
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
    
    
    // MARK: - ConfigureViewController
    func viewSettings() {
        navigationItem.titleView = logoImageView
    }
    
    func viewHierarchy() {}
    
    
}
