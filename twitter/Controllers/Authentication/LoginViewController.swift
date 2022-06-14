import Foundation
import UIKit

class LoginViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    private lazy var logoImageView: UIView = {
        let logoImageView = Components().logoImageView(imageName: "twitter-logo-square")
        return logoImageView
    }()
    
    private lazy var emailContainerView: UIView = {
        let emailContainerView = Components().textFieldContainerView(imageName: "envelope", textField: emailTextField)
        return emailContainerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let passwordContainerView = Components().textFieldContainerView(imageName: "lock", textField: passwordTextField)
        return passwordContainerView
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = Components().textField(placeholder: "Email")
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = Components().textField(placeholder: "Password")
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
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
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(emailContainerView)
        NSLayoutConstraint.activate([
            emailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailContainerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(passwordContainerView)
        NSLayoutConstraint.activate([
            passwordContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordContainerView.topAnchor.constraint(equalTo: emailContainerView.bottomAnchor, constant: 20)
        ])
    }
    
    
}
