import UIKit

final class Components {
    final func dividerLine(width: CGFloat = 0, height: CGFloat = 1, color: UIColor = .lightGray) -> UIView {
        let dividerLine = UIView()
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.backgroundColor = color
        NSLayoutConstraint.activate([
            dividerLine.widthAnchor.constraint(equalToConstant: width),
            dividerLine.heightAnchor.constraint(equalToConstant: height),
        ])
        return dividerLine
    }
    
    final func roundedImageView(imageName: String = "twitter-logo-square", width: CGFloat = 48, height: CGFloat = 48, backgroundColor: UIColor = .clear) -> UIImageView {
        let roundedImageView = UIImageView()
        roundedImageView.translatesAutoresizingMaskIntoConstraints = false
        roundedImageView.backgroundColor = backgroundColor
        roundedImageView.image = UIImage(named: imageName)
        roundedImageView.contentMode = .scaleAspectFit
        roundedImageView.layer.masksToBounds =  true
        roundedImageView.layer.cornerRadius = height / 2
        NSLayoutConstraint.activate([
            roundedImageView.widthAnchor.constraint(equalToConstant: width),
            roundedImageView.heightAnchor.constraint(equalToConstant: height)
        ])
        return roundedImageView
    }
    
    final func authButton(buttonName: String, fontSize: CGFloat = 20, foregroundColor: UIColor = UIColor.white, backgroundColor: UIColor = UIColor.twitterBlue, height: CGFloat = 50) -> UIButton {
        let authButton = UIButton(type: .system)
        authButton.translatesAutoresizingMaskIntoConstraints = false
        authButton.setTitle(buttonName, for: .normal)
        authButton.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        authButton.setTitleColor(foregroundColor, for: .normal)
        authButton.backgroundColor = backgroundColor
        authButton.layer.masksToBounds = true
        authButton.layer.cornerRadius = height / 2
        NSLayoutConstraint.activate([
            authButton.heightAnchor.constraint(equalToConstant: height)
        ])
        return authButton
    }
    
    final func roundedButton(buttonName: String, fontSize: CGFloat = 16, foregroundColor: UIColor = UIColor.white, backgroundColor: UIColor = UIColor.twitterBlue, width: CGFloat = 80, height: CGFloat = 50, iconMode: Bool = false) -> UIButton {
        let roundedButton = UIButton(type: .system)
        roundedButton.translatesAutoresizingMaskIntoConstraints = false
        iconMode
        ? roundedButton.setImage(UIImage(systemName: buttonName), for: .normal)
        : roundedButton.setTitle(buttonName, for: .normal)
        roundedButton.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        roundedButton.tintColor = foregroundColor
        roundedButton.setTitleColor(foregroundColor, for: .normal)
        roundedButton.backgroundColor = backgroundColor
        roundedButton.imageView?.contentMode = .scaleAspectFit
        roundedButton.layer.masksToBounds = true
        roundedButton.layer.cornerRadius = height / 2
        NSLayoutConstraint.activate([
            roundedButton.widthAnchor.constraint(equalToConstant: width),
            roundedButton.heightAnchor.constraint(equalToConstant: height)
        ])
        return roundedButton
    }
    
    final func iconButton(iconName: String, size: CGFloat = 20, color: UIColor = .darkGray) -> UIButton {
        let iconButton = UIButton(type: .system)
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.setImage(UIImage(systemName: iconName), for: .normal)
        iconButton.imageView?.contentMode = .scaleAspectFit
        iconButton.tintColor = color
        NSLayoutConstraint.activate([
            iconButton.widthAnchor.constraint(equalToConstant: size),
            iconButton.heightAnchor.constraint(equalToConstant: size)
        ])
        return iconButton
    }
    
    final func textButton(normalText: String, boldText: String) -> UIButton {
        let textButton = UIButton(type: .system)
        textButton.translatesAutoresizingMaskIntoConstraints = false
        
        let textStyle = NSMutableAttributedString(string: normalText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white])
        textStyle.append(NSMutableAttributedString(string: boldText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]))
        textButton.setAttributedTitle(textStyle, for: .normal)
        return textButton
    }
    
    final func textLabel(text: String, fontSize: CGFloat = 16, fontWeight: UIFont.Weight = .regular, color: UIColor = .darkGray, numberOfLines: Int = 1) -> UILabel {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        textLabel.textColor = color
        textLabel.numberOfLines = numberOfLines
        textLabel.text = text
        return textLabel
    }
    
    final func textField(placeholder: String, whiteMode: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = whiteMode
        ? .white
        : .darkGray
        textField.tintColor = whiteMode
        ? .white
        : .darkGray
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: whiteMode
                    ? UIColor.lightGray
                    : UIColor.darkGray
            ]
        )
        return textField
    }
    
    final func textFieldContainerView(iconName: String, textField: UITextField) -> UIView {
        let textFieldContainerView = UIView()
        textFieldContainerView.translatesAutoresizingMaskIntoConstraints = false
        textFieldContainerView.layer.masksToBounds = true
        textFieldContainerView.layer.cornerRadius = 15
        
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(systemName: iconName)
        iconImageView.tintColor = .white
        
        let dividerLine = self.dividerLine(color: .white)
        
        NSLayoutConstraint.activate([
            textFieldContainerView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        textFieldContainerView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: textFieldContainerView.leadingAnchor, constant: 5),
            iconImageView.centerYAnchor.constraint(equalTo: textFieldContainerView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        textFieldContainerView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: textFieldContainerView.trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: textFieldContainerView.centerYAnchor)
        ])
        
        textFieldContainerView.addSubview(dividerLine)
        NSLayoutConstraint.activate([
            dividerLine.leadingAnchor.constraint(equalTo: textFieldContainerView.leadingAnchor),
            dividerLine.trailingAnchor.constraint(equalTo: textFieldContainerView.trailingAnchor),
            dividerLine.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 6)
        ])
        return textFieldContainerView
    }
}
