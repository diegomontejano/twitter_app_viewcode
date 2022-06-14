import UIKit

class Components {
    func inputContainerView(imageName: String) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 15
        
        let iconName = UIImageView()
        iconName.translatesAutoresizingMaskIntoConstraints = false
        iconName.tintColor = .twitterBlue
        iconName.image = UIImage(systemName: imageName)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        containerView.addSubview(iconName)
        NSLayoutConstraint.activate([
            iconName.widthAnchor.constraint(equalToConstant: 28),
            iconName.heightAnchor.constraint(equalToConstant: 28),
            iconName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            iconName.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        return containerView
    }
    
    
}


//class ComponentAsClass: UIView {
//    // MARK: - Properties
//    let containerView: UIView = {
//        let containerView = UIView()
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.backgroundColor = .white
//        containerView.layer.masksToBounds = true
//        containerView.layer.cornerRadius = 15
//        return containerView
//    }()
//
//    let iconName: UIImageView = {
//        let iconName = UIImageView()
//        iconName.translatesAutoresizingMaskIntoConstraints = false
//        iconName.tintColor = .twitterBlue
//        return iconName
//    }()
//
//
//    // MARK: - Lifecycle
//    // viewcode init method
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        viewHierarchy()
//    }
//
//    // xib/storyboard init method
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//
//    // MARK: - Methods
//    func viewSettings(iconName: String) {
//        self.iconName.image = UIImage(systemName: iconName)
//    }
//
//    func viewHierarchy() {
//        self.addSubview(containerView)
//        NSLayoutConstraint.activate([
//            containerView.heightAnchor.constraint(equalToConstant: 50),
//            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
//            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
//        ])
//
//        containerView.addSubview(iconName)
//        NSLayoutConstraint.activate([
//            iconName.widthAnchor.constraint(equalToConstant: 28),
//            iconName.heightAnchor.constraint(equalToConstant: 28),
//            iconName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            iconName.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
//        ])
//    }
//}
