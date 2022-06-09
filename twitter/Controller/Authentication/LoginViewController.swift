import Foundation
import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
     let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
         logoImageView.contentMode = .scaleAspectFit
         logoImageView.clipsToBounds = true
         logoImageView.image = UIImage(named: "twitter-logo-square")
        return logoImageView
    }()
    
    private lazy var emailContainerView: UIView = {
        let emailContainerView = UIView()
        emailContainerView.setConstraints(height: 50)
        emailContainerView.backgroundColor = .orange
        
        let emailIcon = UIImageView()
        emailIcon.image = UIImage(systemName: "envelope")
        emailIcon.setConstraints(width: 40, height: 40, left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8)
        
        
        
        return emailContainerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let passwordContainerView = UIView()
        passwordContainerView.setConstraints(height: 50)
        passwordContainerView.backgroundColor = .green
        return passwordContainerView
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
        
        let vStack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        vStack.axis = .vertical
        vStack.spacing = 8
        view.addSubview(vStack)
        vStack.setConstraints(left: view.leftAnchor, right: view.rightAnchor, top: logoImageView.bottomAnchor)
    }
    

}
