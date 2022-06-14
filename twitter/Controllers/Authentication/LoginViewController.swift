import Foundation
import UIKit

class LoginViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
     let logoImage: UIImageView = {
        let logoImage = UIImageView()
         logoImage.translatesAutoresizingMaskIntoConstraints = false
         logoImage.image = UIImage(named: "twitter-logo-square")
         logoImage.contentMode = .scaleAspectFit
        return logoImage
    }()
    
//    private lazy var vStack: UIStackView = {
//        let vStack = UIStackView(arrangedSubviews: [fieldEmailContainer, passwordEmailContainer])
//        vStack.translatesAutoresizingMaskIntoConstraints = false
//        vStack.axis = .vertical
//        vStack.spacing = 8
//        return vStack
//    }()
    
    private lazy var emailLoginContainer: UIView = {
        let emailLoginContainer = LoginContainer()
        emailLoginContainer.translatesAutoresizingMaskIntoConstraints = false
        emailLoginContainer.viewSettings(iconName: "envelope")
        return emailLoginContainer
    }()
    
    private lazy var passwordLoginContainer: UIView = {
        let passwordLoginContainer = LoginContainer()
        passwordLoginContainer.translatesAutoresizingMaskIntoConstraints = false
        passwordLoginContainer.viewSettings(iconName: "lock")
        return passwordLoginContainer
    }()
    
    
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
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(emailLoginContainer)
        NSLayoutConstraint.activate([
            emailLoginContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailLoginContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailLoginContainer.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(passwordLoginContainer)
        NSLayoutConstraint.activate([
            passwordLoginContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLoginContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordLoginContainer.topAnchor.constraint(equalTo: emailLoginContainer.bottomAnchor, constant: 70)
        ])
    }
    
    
}
