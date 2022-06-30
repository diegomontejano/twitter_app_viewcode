import UIKit

class Components {
    func imageView(imageName: String, width: CGFloat = 44, height: CGFloat = 44) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: width),
            imageView.heightAnchor.constraint(equalToConstant: height)
        ])
        return imageView
    }
        
    func textField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.tintColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        return textField
    }
    
    func textFieldContainerView(iconName: String, textField: UITextField) -> UIView {
        let textFieldContainerView = UIView()
        textFieldContainerView.translatesAutoresizingMaskIntoConstraints = false
        textFieldContainerView.layer.masksToBounds = true
        textFieldContainerView.layer.cornerRadius = 15
        
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(systemName: iconName)
        iconImageView.tintColor = .white
        
        let dividerLine = UIView()
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            textFieldContainerView.heightAnchor.constraint(equalToConstant: 50),
        ])

        textFieldContainerView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),
            iconImageView.leadingAnchor.constraint(equalTo: textFieldContainerView.leadingAnchor, constant: 5),
            iconImageView.centerYAnchor.constraint(equalTo: textFieldContainerView.centerYAnchor)
        ])
        
        textFieldContainerView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: textFieldContainerView.trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: textFieldContainerView.centerYAnchor)
        ])
        
        textFieldContainerView.addSubview(dividerLine)
        NSLayoutConstraint.activate([
            dividerLine.heightAnchor.constraint(equalToConstant: 1),
            dividerLine.leadingAnchor.constraint(equalTo: textFieldContainerView.leadingAnchor),
            dividerLine.trailingAnchor.constraint(equalTo: textFieldContainerView.trailingAnchor),
            dividerLine.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 6)
        ])
        
        return textFieldContainerView
    }
    
    func roundedButton(title: String) -> UIButton {
        let roundedButton = UIButton(type: .system)
        roundedButton.translatesAutoresizingMaskIntoConstraints = false
        roundedButton.setTitle(title, for: .normal)
        roundedButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        roundedButton.setTitleColor(.twitterBlue, for: .normal)
        roundedButton.backgroundColor = .white
        roundedButton.layer.cornerRadius = 15
        return roundedButton
    }
        
    func titleButton(normalTitle: String, boldTitle: String) -> UIButton {
        let titleButton = UIButton(type: .system)
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        
        let titleStyle = NSMutableAttributedString(string: normalTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white])
        titleStyle.append(NSMutableAttributedString(string: boldTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        titleButton.setAttributedTitle(titleStyle, for: .normal)
        return titleButton
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
