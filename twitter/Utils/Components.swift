import UIKit

class Components {
    func roundedImageView(imageName: String = "", width: CGFloat, height: CGFloat) -> UIImageView {
        let roundedImageView = UIImageView()
        roundedImageView.translatesAutoresizingMaskIntoConstraints = false
        roundedImageView.image = UIImage(named: imageName)
        roundedImageView.contentMode = .scaleAspectFit
        roundedImageView.layer.masksToBounds =  true
        roundedImageView.layer.cornerRadius = width / 2
        NSLayoutConstraint.activate([
            roundedImageView.widthAnchor.constraint(equalToConstant: width),
            roundedImageView.heightAnchor.constraint(equalToConstant: height)
        ])
        return roundedImageView
    }
    
    func roundedButton(title: String, fontSize: CGFloat = 16, width: CGFloat = 80, hight: CGFloat = 50, blueMode: Bool = true, iconMode: Bool = false) -> UIButton {
        let roundedButton = UIButton(type: .system)
        roundedButton.translatesAutoresizingMaskIntoConstraints = false
        iconMode ? roundedButton.setImage(UIImage(systemName: title), for: .normal) : roundedButton.setTitle(title, for: .normal)
        roundedButton.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        roundedButton.tintColor = blueMode ? .white : .twitterBlue
        roundedButton.setTitleColor(blueMode ? .white : .twitterBlue, for: .normal)
        roundedButton.backgroundColor = blueMode ? .twitterBlue : .white
        roundedButton.imageView?.contentMode = .scaleAspectFit
        roundedButton.layer.masksToBounds = true
        roundedButton.layer.cornerRadius = hight / 2
        NSLayoutConstraint.activate([
            roundedButton.widthAnchor.constraint(equalToConstant: width),
            roundedButton.heightAnchor.constraint(equalToConstant: hight)
        ])
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
