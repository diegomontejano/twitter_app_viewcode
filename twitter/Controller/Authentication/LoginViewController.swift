import Foundation
import UIKit

class LoginViewController: UIViewController, ConfigureView {
    // MARK: - Properties
     let logoImage: UIImageView = {
        let logoImage = UIImageView()
         logoImage.translatesAutoresizingMaskIntoConstraints = false
         logoImage.image = UIImage(named: "twitter-logo-square")
         logoImage.contentMode = .scaleAspectFit
        return logoImage
    }()
    
//    private lazy var vStack: UIStackView = {
//        let vStack = UIStackView(arrangedSubviews: [emailContainer, passwordContainer])
//        vStack.translatesAutoresizingMaskIntoConstraints = false
//        vStack.axis = .vertical
//        vStack.spacing = 8
//        return vStack
//    }()
    
    private lazy var emailContainer: UIView = {
        let emailContainer = UIView()
        emailContainer.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.backgroundColor = .white
        emailContainer.layer.masksToBounds = true
        emailContainer.layer.cornerRadius = 15
        return emailContainer
    }()
    
    private lazy var passwordContainer: UIView = {
        let passwordContainer = UIView()
        passwordContainer.translatesAutoresizingMaskIntoConstraints = false
        passwordContainer.backgroundColor = .white
        passwordContainer.layer.masksToBounds = true
        passwordContainer.layer.cornerRadius = 15
        return passwordContainer
    }()
    
    private lazy var emailIcon: UIImageView = {
        let emailIcon = UIImageView()
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        emailIcon.image = UIImage(systemName: "envelope")
        emailIcon.tintColor = .twitterBlue
        return emailIcon
    }()
    
    private lazy var passwordIcon: UIImageView = {
        let passwordIcon = UIImageView()
        passwordIcon.translatesAutoresizingMaskIntoConstraints = false
        passwordIcon.image = UIImage(systemName: "lock")
        passwordIcon.tintColor = .twitterBlue
        return passwordIcon
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

        view.addSubview(emailContainer)
        NSLayoutConstraint.activate([
            emailContainer.heightAnchor.constraint(equalToConstant: 50),
            emailContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailContainer.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20)
        ])
        
        emailContainer.addSubview(emailIcon)
        NSLayoutConstraint.activate([
            emailIcon.widthAnchor.constraint(equalToConstant: 28),
            emailIcon.heightAnchor.constraint(equalToConstant: 28),
            emailIcon.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: 10),
            emailIcon.centerYAnchor.constraint(equalTo: emailContainer.centerYAnchor)
        ])
        
        view.addSubview(passwordContainer)
        NSLayoutConstraint.activate([
            passwordContainer.heightAnchor.constraint(equalToConstant: 50),
            passwordContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordContainer.topAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 20)
        ])
        
        passwordContainer.addSubview(passwordIcon)
        NSLayoutConstraint.activate([
            passwordIcon.widthAnchor.constraint(equalToConstant: 28),
            passwordIcon.heightAnchor.constraint(equalToConstant: 28),
            passwordIcon.leadingAnchor.constraint(equalTo: passwordContainer.leadingAnchor, constant: 10),
            passwordIcon.centerYAnchor.constraint(equalTo: passwordContainer.centerYAnchor)
        ])
    }
    
    
}
