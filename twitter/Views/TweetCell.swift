import Foundation
import UIKit

class TweetCell: UICollectionViewCell, ConfigureView {
    // MARK: - Properties
    private lazy var userImageView: UIImageView = {
        let userImageView = Components().roundedImageView(width: 48, height: 48)
        userImageView.backgroundColor = .red
        //userImageView.sd_setImage(with: URL(string: " "))
        return userImageView
    }()
    
//    private let tweetCaptionLabel: UILabel = {
//        let tweetCaptionLabel = UILabel()
//        tweetCaptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        tweetCaptionLabel.font = UIFont.systemFont(ofSize: 16)
//        tweetCaptionLabel.textColor = .black
//        tweetCaptionLabel.numberOfLines = 0
//        tweetCaptionLabel.text = "Testing............"
//        return tweetCaptionLabel
//    }()
    
    private let dividerLine: UIView = {
        let dividerLine = Components().dividerLine(color: .red)
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
        backgroundColor = .systemGray6
    }
    
    func viewHierarchy() {
        addSubview(userImageView)
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
//        addSubview(tweetCaptionLabel)
//        NSLayoutConstraint.activate([
//            tweetCaptionLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
//            tweetCaptionLabel.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor)
//        ])
        
        addSubview(dividerLine)
        NSLayoutConstraint.activate([
            dividerLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dividerLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dividerLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    
    // MARK: - Methods

    
}
