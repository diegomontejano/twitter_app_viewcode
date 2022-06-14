import UIKit

class Components {
    func inputContainerView(imageName: String) -> UIView {
        let inputContainerView = UIView()
        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
        inputContainerView.backgroundColor = .white
        inputContainerView.layer.masksToBounds = true
        inputContainerView.layer.cornerRadius = 15
        
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.tintColor = .twitterBlue
        iconImageView.image = UIImage(systemName: imageName)
        
        NSLayoutConstraint.activate([
            inputContainerView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        inputContainerView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),
            iconImageView.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: inputContainerView.centerYAnchor)
        ])
        return inputContainerView
    }
    
    func logoImageView(imageName: String) -> UIImageView {
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: imageName)
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }
    
    
}


//class ComponentAsClass: UIView {
//    // MARK: - Properties
//    let inputContainerView: UIView = {
//        let inputContainerView = UIView()
//        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
//        inputContainerView.backgroundColor = .white
//        inputContainerView.layer.masksToBounds = true
//        inputContainerView.layer.cornerRadius = 15
//        return inputContainerView
//    }()
//
//    let iconImageView: UIImageView = {
//        let iconImageView = UIImageView()
//        iconImageView.translatesAutoresizingMaskIntoConstraints = false
//        iconImageView.tintColor = .twitterBlue
//        return iconImageView
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
//    func viewSettings(imageName: String) {
//        iconImageView.image = UIImage(systemName: imageName)
//    }
//
//    func viewHierarchy() {
//        self.addSubview(inputContainerView)
//        NSLayoutConstraint.activate([
//            inputContainerView.heightAnchor.constraint(equalToConstant: 50),
//            inputContainerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            inputContainerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
//            inputContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
//        ])
//
//        inputContainerView.addSubview(iconImageView)
//        NSLayoutConstraint.activate([
//            iconImageView.widthAnchor.constraint(equalToConstant: 28),
//            iconImageView.heightAnchor.constraint(equalToConstant: 28),
//            iconImageView.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 10),
//            iconImageView.centerYAnchor.constraint(equalTo: inputContainerView.centerYAnchor)
//        ])
//    }
//}
