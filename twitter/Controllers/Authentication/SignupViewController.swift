import UIKit

class SignupViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    
    private lazy var profileImageButton: UIButton = {
        let profileImageButton = UIButton(type: .system)
        profileImageButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageButton.setImage(UIImage(named: "add-photo"), for: .normal)
        profileImageButton.imageView?.contentMode = .scaleAspectFill
        profileImageButton.imageView?.clipsToBounds = true
        profileImageButton.tintColor = .white
        profileImageButton.layer.cornerRadius = 140 / 2
        profileImageButton.layer.masksToBounds = true
        profileImageButton.addTarget(self, action: #selector(pressProfileImageButton), for: .touchUpInside)
        return profileImageButton
    }()
    
    private lazy var usernameContainerView: UIView = {
        let usernameContainerView = Components().textFieldContainerView(iconName: "person", textField: usernameTextField)
        return usernameContainerView
    }()
    
    private lazy var usernameTextField: UITextField = {
        let usernameTextField = Components().textField(placeholder: "Username")
        return usernameTextField
    }()
    
    private lazy var nameContainerView: UIView = {
        let nameContainerView = Components().textFieldContainerView(iconName: "person", textField: fullNameTextField)
        return nameContainerView
    }()
    
    private let fullNameTextField: UITextField = {
        let fullNameTextField = Components().textField(placeholder: "Full Name")
        return fullNameTextField
    }()
    
    private lazy var emailContainerView: UIView = {
        let emailContainerView = Components().textFieldContainerView(iconName: "envelope", textField: emailTextField)
        return emailContainerView
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = Components().textField(placeholder: "Email")
        return emailTextField
    }()
    
    private lazy var passwordContainerView: UIView = {
        let passwordContainerView = Components().textFieldContainerView(iconName: "lock", textField: passwordTextField)
        return passwordContainerView
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = Components().textField(placeholder: "Password")
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private lazy var signupButton: UIButton = {
        let loginButton = Components().roundedButton(title: "Sign Up")
        loginButton.addTarget(self, action: #selector(pressSignupButton), for: .touchUpInside)
        return loginButton
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let alreadyHaveAccountButton = Components().titleButton(normalTitle: "Allready have an account? ", boldTitle: "Log In")
        alreadyHaveAccountButton.addTarget(self, action: #selector(pressAlreadyHaveAccountButton), for: .touchUpInside)
        return alreadyHaveAccountButton
    }()
        
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func viewHierarchy() {
        view.addSubview(profileImageButton)
        NSLayoutConstraint.activate([
            profileImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageButton.widthAnchor.constraint(equalToConstant: 140),
            profileImageButton.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        view.addSubview(usernameContainerView)
        NSLayoutConstraint.activate([
            usernameContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameContainerView.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(nameContainerView)
        NSLayoutConstraint.activate([
            nameContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameContainerView.topAnchor.constraint(equalTo: usernameContainerView.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(emailContainerView)
        NSLayoutConstraint.activate([
            emailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailContainerView.topAnchor.constraint(equalTo: nameContainerView.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(passwordContainerView)
        NSLayoutConstraint.activate([
            passwordContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordContainerView.topAnchor.constraint(equalTo: emailContainerView.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(signupButton)
        NSLayoutConstraint.activate([
            signupButton.heightAnchor.constraint(equalToConstant: 50),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signupButton.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 20),
        ])
        
        view.addSubview(alreadyHaveAccountButton)
        NSLayoutConstraint.activate([
            alreadyHaveAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alreadyHaveAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    // MARK: - Methods
    @objc func pressProfileImageButton() {
        present(imagePicker, animated: true)
    }
    
    @objc func pressSignupButton() {
        guard let profileImage = profileImage else {
            print("DEBUG: no profile image selected.")
            return
        }
        guard let username = usernameTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.instance.signUp(profileImage: profileImage, username: username, fullName: fullName, email: email, password: password) { (error, ref) in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            guard let tabBarController = UIApplication.shared.keyWindow?.rootViewController as? TabBarController else { return }
            tabBarController.authenticateUser()
            self.dismiss(animated: true)
        }
    }
    
    @objc func pressAlreadyHaveAccountButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        self.profileImage = profileImage
                
        profileImageButton.layer.borderColor = UIColor.white.cgColor
        profileImageButton.layer.borderWidth = 3
        self.profileImageButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true)
    }
}
