import UIKit

class ProfileFilterCollectionViewCell: UICollectionViewCell, DMConfigureView {
    // MARK: - Properties
    static let identifier: String = "ProfileFilterCollectionViewCell"
    
    let filterLabel: UILabel = {
        let filterLabel = Components().textLabel(text: "filterLabel", fontSize: 14, color: UIColor.systemGray2)
        return filterLabel
    }()
    
    override var isSelected: Bool {
        didSet {
            filterLabel.font = isSelected
            ? UIFont.systemFont(ofSize: 16, weight: .bold)
            : UIFont.systemFont(ofSize: 14, weight: .regular)
            
            filterLabel.textColor = isSelected
            ? .twitterBlue
            : .systemGray2
        }
    }
    
    
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
        addSubview(filterLabel)
        NSLayoutConstraint.activate([
            filterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            filterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
