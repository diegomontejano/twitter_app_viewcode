import UIKit

class FeedController: UIViewController {
    // MARK: - Properties
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "twitter-logo-blue")
        return logoImageView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    // MARK: - Methods
    func configureView() {
        view.backgroundColor = .white
        navigationItem.titleView = logoImageView
    }
    
    
}
