import UIKit
import SDWebImage
import FirebaseAuth

class FeedViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        }
    }
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.masksToBounds =  true
        profileImageView.layer.cornerRadius = 32 / 2
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 32),
            profileImageView.heightAnchor.constraint(equalToConstant: 32)
        ])
        return profileImageView
    }()
    
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.titleView = Components().imageView(imageName: "twitter-logo")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        // log out button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logOutUser))
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods
    @objc func logOutUser() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let nav = UINavigationController.init(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
}
