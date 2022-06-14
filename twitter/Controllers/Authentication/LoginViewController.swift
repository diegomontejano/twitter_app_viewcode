import Foundation
import UIKit

class LoginViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
     let logoImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.image = UIImage(named: "twitter-logo-square")
         imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var emailInputContainerView = Components().inputContainerView(imageName: "envelope")
    
    private lazy var passwordInputContainerView = Components().inputContainerView(imageName: "lock")
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    
    // MARK: - Methods
    func viewSettings() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
    }
    
    func viewHierarchy() {
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(emailInputContainerView)
        NSLayoutConstraint.activate([
            emailInputContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailInputContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailInputContainerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(passwordInputContainerView)
        NSLayoutConstraint.activate([
            passwordInputContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordInputContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordInputContainerView.topAnchor.constraint(equalTo: emailInputContainerView.bottomAnchor, constant: 20)
        ])
    }
    
    
}
