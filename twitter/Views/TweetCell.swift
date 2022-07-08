import Foundation
import UIKit

class TweetCell: UICollectionViewCell, ConfigureView {
    // MARK: - Properties
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(width: 48, height: 48)
        profileImageView.backgroundColor = .twitterBlue
        //profileImageView.sd_setImage(with: URL(string: " "))
        return profileImageView
    }()
    
    private let fullnameLabel: UILabel = {
        let fullnameLabel = Components().textLabel(text: "Diego", weight: .bold)
        return fullnameLabel
    }()
    
    private let usernameLabel: UILabel = {
        let usernameLabel = Components().textLabel(text: "@diego", fontSize: 14, color: UIColor.systemGray2)
        return usernameLabel
    }()
    
    private let timestampLabel: UILabel = {
        let timestampLabel = Components().textLabel(text: "• 3h", fontSize: 14, color: UIColor.systemGray2)
        return timestampLabel
    }()
    
    private let tweetCaptionLabel: UILabel = {
        let tweetCaptionLabel = Components().textLabel(text: "tweet caption label test", fontSize: 14, numberOfLines: 0)
        return tweetCaptionLabel
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
        let shareButton = Components().iconButton(iconName: "arrowshape.turn.up.right")
        shareButton.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        return shareButton
    }()
    
    private let dividerLine: UIView = {
        let dividerLine = Components().dividerLine()
        return dividerLine
    }()
    
    
    // MARK: - ConfigureView
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSettings()
        viewHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func viewSettings() {
        backgroundColor = .white
    }
    
    func viewHierarchy() {
        addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        addSubview(fullnameLabel)
        NSLayoutConstraint.activate([
            fullnameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            fullnameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor)
        ])
        
        addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: fullnameLabel.trailingAnchor, constant: 5),
            usernameLabel.centerYAnchor.constraint(equalTo: fullnameLabel.centerYAnchor)
        ])
        
        addSubview(timestampLabel)
        NSLayoutConstraint.activate([
            timestampLabel.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 5),
            timestampLabel.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor)
        ])
        
        addSubview(tweetCaptionLabel)
        NSLayoutConstraint.activate([
            tweetCaptionLabel.leadingAnchor.constraint(equalTo: fullnameLabel.leadingAnchor),
            tweetCaptionLabel.topAnchor.constraint(equalTo: fullnameLabel.bottomAnchor, constant: 7)
        ])
        
        addSubview(dividerLine)
        NSLayoutConstraint.activate([
            dividerLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        let actionsButtonsStack = UIStackView(arrangedSubviews: [commentButton, retweetButton, likeButton, shareButton])
        actionsButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        actionsButtonsStack.axis = .horizontal
        actionsButtonsStack.spacing = 60
        addSubview(actionsButtonsStack)
        NSLayoutConstraint.activate([
            actionsButtonsStack.bottomAnchor.constraint(equalTo: dividerLine.topAnchor, constant: -10),
            actionsButtonsStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        

    }
    
    
    // MARK: - Methods
    @objc func commentButtonPressed(){
        
    }
    
    @objc func retweetButtonPressed(){
        
    }
    
    @objc func likeButtonPressed(){
        
    }
    
    @objc func shareButtonPressed() {
        
    }
    
    
}
