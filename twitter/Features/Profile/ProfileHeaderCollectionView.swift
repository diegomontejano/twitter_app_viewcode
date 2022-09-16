import UIKit

class ProfileHeaderCollectionView: UICollectionReusableView, DMConfigureView {
    // MARK: - Properties
    static let identifier: String = "ProfileHeaderCollectionView"
    
    private lazy var blueContainerView: UIView = {
        let blueContainerView = UIView()
        blueContainerView.translatesAutoresizingMaskIntoConstraints = false
        blueContainerView.backgroundColor = .twitterBlue
        return blueContainerView
    }()
    
    private lazy var backButton: UIButton = {
        lazy var backButton = Components().iconButton(iconName: "arrow.left", size: 30, color: .white)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return backButton
    }()
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(imageName: "twitter-logo-square", width: 80, height: 80, backgroundColor: .twitterBlue)
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 4
        return profileImageView
    }()
    
    private lazy var followUnfollowButton: UIButton = {
        let followUnfollowButton = Components().roundedButton(buttonName: "Follow", fontSize: 14, foregroundColor: .twitterBlue, backgroundColor: .white, width: 100, height: 36)
        followUnfollowButton.layer.borderColor = UIColor.twitterBlue.cgColor
        followUnfollowButton.layer.borderWidth = 1.5
        followUnfollowButton.addTarget(self, action: #selector(followUnfollowButtonPressed), for: .touchUpInside)
        return followUnfollowButton
    }()
    
    private let fullNameLabel: UILabel = {
        let fullNameLabel = Components().textLabel(text: "User", fontSize: 20, fontWeight: .bold)
        return fullNameLabel
    }()
    
    private let usernameLabel: UILabel = {
        let usernameLabel = Components().textLabel(text: "@user", color: UIColor.systemGray2)
        return usernameLabel
    }()
    
    private let bioLabel: UILabel = {
        let usernameLabel = Components().textLabel(text: "bio example", numberOfLines: 3)
        return usernameLabel
    }()
    
    private let profileFilterView = ProfileFilterView()
    
        
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    func configureView() {
        backgroundColor = .white
    }
    
    func configureViewConstraints() {
        addSubview(blueContainerView)
        NSLayoutConstraint.activate([
            blueContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blueContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blueContainerView.topAnchor.constraint(equalTo: topAnchor),
            blueContainerView.heightAnchor.constraint(equalToConstant: 140),
        ])
        
        addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: blueContainerView.leadingAnchor, constant: 10),
            backButton.topAnchor.constraint(equalTo: blueContainerView.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
        
        addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: blueContainerView.leadingAnchor, constant: 10),
            profileImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
        ])
        
        addSubview(followUnfollowButton)
        NSLayoutConstraint.activate([
            followUnfollowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            followUnfollowButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
        ])
        
        addSubview(fullNameLabel)
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fullNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 3),
        ])
        
        addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 3),
        ])
        
        addSubview(bioLabel)
        NSLayoutConstraint.activate([
            bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 3),
        ])
        
        addSubview(profileFilterView)
        profileFilterView.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            profileFilterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileFilterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileFilterView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileFilterView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func backButtonPressed() {
        print("DEBUG: backButtonPressed")
    }
    
    @objc func followUnfollowButtonPressed() {
        print("DEBUG: followUnfollowButton")
    }
}

