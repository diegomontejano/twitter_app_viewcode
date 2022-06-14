import UIKit

class LoginContainer: UIView {
    // MARK: - Properties
    let fieldContainer: UIView = {
        let fieldContainer = UIView()
        fieldContainer.translatesAutoresizingMaskIntoConstraints = false
        fieldContainer.backgroundColor = .white
        fieldContainer.layer.masksToBounds = true
        fieldContainer.layer.cornerRadius = 15
        return fieldContainer
    }()
    
    let iconName: UIImageView = {
        let iconName = UIImageView()
        iconName.translatesAutoresizingMaskIntoConstraints = false
        iconName.tintColor = .twitterBlue
        return iconName
    }()
    
    
    // MARK: - Lifecycle
    // viewcode init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewHierarchy()
    }
    
    // xib/storyboard init method
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Methods
    func viewSettings(iconName: String) {
        self.iconName.image = UIImage(systemName: iconName)
    }
    
    func viewHierarchy() {
        self.addSubview(fieldContainer)
        NSLayoutConstraint.activate([
            fieldContainer.heightAnchor.constraint(equalToConstant: 50),
            fieldContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            fieldContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            fieldContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        fieldContainer.addSubview(iconName)
        NSLayoutConstraint.activate([
            iconName.widthAnchor.constraint(equalToConstant: 28),
            iconName.heightAnchor.constraint(equalToConstant: 28),
            iconName.leadingAnchor.constraint(equalTo: fieldContainer.leadingAnchor, constant: 10),
            iconName.centerYAnchor.constraint(equalTo: fieldContainer.centerYAnchor)
        ])
    }
    
    
}
