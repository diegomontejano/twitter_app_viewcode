//  Created by Diego Montejano on 01/07/22.
import Foundation
import UIKit
import SDWebImage

class UploadTweetViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    private let user: User
        
    private lazy var addTweetButton: UIButton = {
        let addTweetButton = Components().roundedButton(title: "Tweet", width: 65, height: 32)
        addTweetButton.addTarget(self, action: #selector(addTweetButtonPressed), for: .touchUpInside)
        return addTweetButton
    }()
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(width: 48, height: 48)
        profileImageView.sd_setImage(with: URL(string: user.profileImageURL))
        return profileImageView
    }()
    
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    init(user: User){
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewSettings() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemBlue
        
        // cancel button
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        // tweet button
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addTweetButton)
    }
    
    func viewHierarchy() {
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    
    // MARK: - Methods
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc func addTweetButtonPressed() {
        print("DEBUG: addTweetButtonPressed")
    }
    
    
}
