//  Created by Diego Montejano on 01/07/22.
import Foundation
import UIKit

class UploadTweetViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    private lazy var addTweetButton: UIButton = {
        let addTweetButton = Components().roundedButton(title: "Tweet", width: 65, hight: 32)
        addTweetButton.addTarget(self, action: #selector(addTweetButtonPressed), for: .touchUpInside)
        return addTweetButton
    }()
    
    private lazy var profileImageView: UIImageView = {
        let profileImageView = Components().roundedImageView(width: 48, height: 48)
        return profileImageView
    }()
    
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
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
        
    }
    
    
    // MARK: - Methods
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc func addTweetButtonPressed() {
        print("DEBUG: addTweetButtonPressed")
    }
    
    
}
