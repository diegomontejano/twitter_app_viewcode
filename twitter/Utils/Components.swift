import UIKit

class Components {
    func logoImageView(imageName: String) -> UIImageView {
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: imageName)
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }
        
    func textField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.textColor = .gray
        return textField
    }
    
    func textFieldContainerView(imageName: String, textField: UITextField) -> UIView {
        let textFieldContainerView = UIView()
        textFieldContainerView.translatesAutoresizingMaskIntoConstraints = false
        textFieldContainerView.backgroundColor = .white
        textFieldContainerView.layer.masksToBounds = true
        textFieldContainerView.layer.cornerRadius = 15
        
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(systemName: imageName)
        iconImageView.tintColor = .twitterBlue
        
        NSLayoutConstraint.activate([
            textFieldContainerView.heightAnchor.constraint(equalToConstant: 50),
        ])

        textFieldContainerView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),
            iconImageView.leadingAnchor.constraint(equalTo: textFieldContainerView.leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: textFieldContainerView.centerYAnchor)
        ])
        
        textFieldContainerView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: textFieldContainerView.trailingAnchor, constant: 10),
            textField.centerYAnchor.constraint(equalTo: textFieldContainerView.centerYAnchor)
        ])
        return textFieldContainerView
    }
    
    
}


//class ComponentAsClass: UIView {
//    // MARK: - Properties
//    let textFieldContainerView: UIView = {
//        let textFieldContainerView = UIView()
//        textFieldContainerView.translatesAutoresizingMaskIntoConstraints = false
//        textFieldContainerView.backgroundColor = .white
//        textFieldContainerView.layer.masksToBounds = true
//        textFieldContainerView.layer.cornerRadius = 15
//        return textFieldContainerView
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
//        self.addSubview(textFieldContainerView)
//        NSLayoutConstraint.activate([
//            textFieldContainerView.heightAnchor.constraint(equalToConstant: 50),
//            textFieldContainerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            textFieldContainerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
//            textFieldContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
//        ])
//
//        textFieldContainerView.addSubview(iconImageView)
//        NSLayoutConstraint.activate([
//            iconImageView.widthAnchor.constraint(equalToConstant: 28),
//            iconImageView.heightAnchor.constraint(equalToConstant: 28),
//            iconImageView.leadingAnchor.constraint(equalTo: textFieldContainerView.leadingAnchor, constant: 10),
//            iconImageView.centerYAnchor.constraint(equalTo: textFieldContainerView.centerYAnchor)
//        ])
//    }
//}
