//  Created by Diego Montejano on 01/07/22.
import Foundation
import UIKit

class UploadTweetViewController: UIViewController, ConfigureViewController {
    // MARK: - Properties
    
    
    // MARK: - ConfigureViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        view.backgroundColor = .systemPink
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .systemBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
}
