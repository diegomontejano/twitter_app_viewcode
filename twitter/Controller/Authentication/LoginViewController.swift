import Foundation
import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
     let logoImageView: UIImageView = {
        let _view = UIImageView()
        _view.contentMode = .scaleAspectFit
        _view.clipsToBounds = true
        _view.image = UIImage(named: "twitter-logo-square")
        return _view
    }()
    
    private lazy var containerEmailView: UIView = {
        let _view = UIView()
        _view.setConstraints(height: 50)
        _view.backgroundColor = .orange
        return _view
    }()
    
    private lazy var containerPasswordView: UIView = {
        let _view = UIView()
        _view.setConstraints(height: 50)
        _view.backgroundColor = .green
        return _view
    }()
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bodyView()
    }
    
    
    // MARK: - Methods
    func configureView() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
    }
    
    func bodyView() {
        view.addSubview(logoImageView)
        logoImageView.setConstraints(width: 150, height: 150)
        logoImageView.setCenter(view: view, topAnchor: view.topAnchor, paddingTop: 30)
        
        let vStack = UIStackView(arrangedSubviews: [containerEmailView, containerPasswordView])
        vStack.axis = .vertical
        vStack.spacing = 8
        view.addSubview(vStack)
        vStack.setConstraints(left: view.leftAnchor, right: view.rightAnchor, top: logoImageView.bottomAnchor)
    }
    

}
