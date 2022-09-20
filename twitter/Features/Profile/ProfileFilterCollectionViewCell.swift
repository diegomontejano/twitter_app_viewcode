import UIKit

class ProfileFilterCollectionViewCell: UICollectionViewCell, DMConfigureView {
    // MARK: - Properties
    static let identifier: String = "ProfileFilterCollectionViewCell"
    
    let filterLabel: UILabel = {
        let filterLabel = Components().textLabel(text: "filterLabel", fontSize: 14, color: UIColor.systemGray2)
        return filterLabel
    }()
    
    private let dividerLine: UIView = {
        let dividerLine = Components().dividerLine(height: 2, color: .clear)
        return dividerLine
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                filterLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                filterLabel.textColor = .twitterBlue
                dividerLine.backgroundColor = .twitterBlue
            } else {
                filterLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                filterLabel.textColor = .systemGray2
                dividerLine.backgroundColor = .clear
            }
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
        
        addSubview(dividerLine)
        NSLayoutConstraint.activate([
            dividerLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerLine.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 8),
        ])
    }
}
