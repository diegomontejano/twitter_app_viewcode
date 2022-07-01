import UIKit
import SDWebImage

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            
            let profileImageView = UIImageView()
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
        
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        let logoImageView = Components().imageView(imageName: "twitter-logo")
        navigationItem.titleView = logoImageView
    }
    
    
    // MARK: - Methods
    func viewHierarchy() {
        
    }
    
    
}
