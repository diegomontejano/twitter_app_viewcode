import UIKit

class ProfileHeader: UICollectionReusableView {
    // MARK: - Properties
    static let identifier: String = "ProfileHeader"
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    
}

