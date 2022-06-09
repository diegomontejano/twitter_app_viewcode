import UIKit

class FeedController: UIViewController {
    // MARK: - Properties
    let logoImageView: UIImageView = {
        let _view = UIImageView()
        _view.contentMode = .scaleAspectFit
        _view.image = UIImage(named: "twitter-logo-blue")
        return _view
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
