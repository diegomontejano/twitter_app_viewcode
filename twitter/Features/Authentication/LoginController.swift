import UIKit

class LoginController: UIViewController, DMConfigureView {
    // MARK: - Properties
    private lazy var logoImageView: UIView = {
        let logoImageView = Components().roundedImageView(imageName: "twitter-logo-square", width: 150, height: 150)
        return logoImageView
    }()
    
    private lazy var emailContainerView: UIView = {
        let emailContainerView = Components().textFieldContainerView(iconName: "envelope", textField: emailTextField)
        return emailContainerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let passwordContainerView = Components().textFieldContainerView(iconName: "lock", textField: passwordTextField)
        return passwordContainerView
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = Components().textField(placeholder: "Email", whiteMode: true)
        emailTextField.text = "diego@gmail.com"
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = Components().textField(placeholder: "Password", whiteMode: true)
        passwordTextField.text = "123456"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = Components().roundedButton(buttonName: "Log In", fontSize: 20, foregroundColor: .twitterBlue, backgroundColor: .white)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return loginButton
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let dontHaveAccountButton = Components().textButton(normalText: "Don't have an account? ", boldText: "Sign Up")
        dontHaveAccountButton.addTarget(self, action: #selector(dontHaveAccountButtonPressed), for: .touchUpInside)
        return dontHaveAccountButton
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureViewConstraints()
    }
    
    
    // MARK: - Methods
    func configureView() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureViewConstraints() {
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
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
        
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 20),
        ])
        
        view.addSubview(dontHaveAccountButton)
        NSLayoutConstraint.activate([
            dontHaveAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dontHaveAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dontHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func loginButtonPressed() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.instance.logIn(email: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
            mainTabBarController.authenticateUser()
            self.dismiss(animated: true)
        }
    }
    
    @objc func dontHaveAccountButtonPressed() {
        navigationController?.pushViewController(SignupController(), animated: true)
    }
}
