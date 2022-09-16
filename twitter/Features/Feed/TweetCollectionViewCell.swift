import UIKit

protocol TweetCollectionViewCellDelegate: AnyObject {
    func navigateToProfileController()
}

class TweetCollectionViewCell: UICollectionViewCell, DMConfigureView {
    // MARK: - Properties
    static let identifier: String = "TweetCollectionViewCell"
    
    weak var delegate: TweetCollectionViewCellDelegate?
    
    var tweet: Tweet? {
        didSet {
            guard let tweet = tweet else { return }
            let tweetViewModel = TweetViewModel(tweet: tweet)
            
            profileImageView.sd_setImage(with: tweetViewModel.profileImageView)
            fullNameLabel.text = tweetViewModel.fullName
            usernameLabel.text = tweetViewModel.username
            tweetTimeLabel.text = tweetViewModel.tweetTime
            tweetTextLabel.text = tweetViewModel.tweetText
        }
    }
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(imageName: "twitter-logo-square", width: 48, height: 48, backgroundColor: .twitterBlue)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.profileImageViewPressed))
        profileImageView.addGestureRecognizer(tapGesture)
        profileImageView.isUserInteractionEnabled = true
        return profileImageView
    }()
    
    private let fullNameLabel: UILabel = {
        let fullNameLabel = Components().textLabel(text: "User", fontWeight: .bold)
        return fullNameLabel
    }()
    
    private let usernameLabel: UILabel = {
        let usernameLabel = Components().textLabel(text: "@user", fontSize: 14, color: UIColor.systemGray2)
        return usernameLabel
    }()
    
    private let tweetTimeLabel: UILabel = {
        let tweetTimeLabel = Components().textLabel(text: "• 3h", fontSize: 14, color: UIColor.systemGray2)
        return tweetTimeLabel
    }()
    
    private let tweetTextLabel: UILabel = {
        let tweetTextLabel = Components().textLabel(text: "tweet example", fontSize: 14, numberOfLines: 0)
        return tweetTextLabel
    }()
    
    private lazy var commentButton: UIButton = {
        let commentButton = Components().iconButton(iconName: "message")
        commentButton.addTarget(self, action: #selector(commentButtonPressed), for: .touchUpInside)
        return commentButton
    }()
    
    private lazy var retweetButton: UIButton = {
        let retweetButton = Components().iconButton(iconName: "arrow.triangle.2.circlepath")
        retweetButton.addTarget(self, action: #selector(retweetButtonPressed), for: .touchUpInside)
        return retweetButton
    }()
    
    private lazy var likeButton: UIButton = {
        let likeButton = Components().iconButton(iconName: "heart")
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return likeButton
    }()
    
    private lazy var shareButton: UIButton = {
        let shareButton = Components().iconButton(iconName: "square.and.arrow.up")
        shareButton.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        return shareButton
    }()
    
    private lazy var actionsButtonsStack: UIStackView = {
        let actionsButtonsStack = UIStackView(arrangedSubviews: [commentButton, retweetButton, likeButton, shareButton])
        actionsButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        actionsButtonsStack.axis = .horizontal
        actionsButtonsStack.spacing = 60
        return actionsButtonsStack
    }()
    
    
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
        contentView.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])

        contentView.addSubview(fullNameLabel)
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            fullNameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor)
        ])

        contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor, constant: 5),
            usernameLabel.centerYAnchor.constraint(equalTo: fullNameLabel.centerYAnchor)
        ])

        contentView.addSubview(tweetTimeLabel)
        NSLayoutConstraint.activate([
            tweetTimeLabel.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 5),
            tweetTimeLabel.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor)
        ])

        contentView.addSubview(tweetTextLabel)
        NSLayoutConstraint.activate([
            tweetTextLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            tweetTextLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 7)
        ])

        addSubview(actionsButtonsStack)
        NSLayoutConstraint.activate([
            actionsButtonsStack.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 50),
            actionsButtonsStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    @objc func profileImageViewPressed() {
        delegate?.navigateToProfileController()
    }
    
    @objc func commentButtonPressed() {
        print("DEBUG: commentButtonPressed")
    }
    
    @objc func retweetButtonPressed() {
        print("DEBUG: retweetButtonPressed")
    }
    
    @objc func likeButtonPressed() {
        print("DEBUG: likeButtonPressed")
    }
    
    @objc func shareButtonPressed() {
        print("DEBUG: shareButtonPressed")
    }
}
