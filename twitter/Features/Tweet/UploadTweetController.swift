import UIKit
import SDWebImage

class UploadTweetController: UIViewController, DMConfigureView {
    // MARK: - Properties
    private let user: User
        
    private lazy var addTweetButton: UIButton = {
        let addTweetButton = Components().roundedButton(buttonName: "Tweet", width: 65, height: 32)
        addTweetButton.addTarget(self, action: #selector(addTweetButtonPressed), for: .touchUpInside)
        return addTweetButton
    }()
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(width: 48, height: 48)
        profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        return profileImageView
    }()
    
    private lazy var tweetTextField: UITextField = {
        let tweetTextField = Components().textField(placeholder: "What's happening?")
        tweetTextField.becomeFirstResponder()
        return tweetTextField
    }()
    
    
    // MARK: - Constructor
    init(user: User){
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureViewConstraints()
    }
    
    
    // MARK: - Methods
    func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addTweetButton)
    }
    
    func configureViewConstraints() {
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        view.addSubview(tweetTextField)
        NSLayoutConstraint.activate([
            tweetTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            tweetTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tweetTextField.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ])
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc func addTweetButtonPressed() {
        guard let tweetTextField = tweetTextField.text else { return }
       
        TweetService.instance.uploadTweet(tweetText: tweetTextField) { (error, ref) in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true)
        }
    }
}
