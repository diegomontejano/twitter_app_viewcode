import Foundation
import UIKit

class SignUpViewController: UIViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    
    // MARK: - Methods
    func viewSettings() {
        view.backgroundColor = .twitterBlue
    }
    
    func viewHierarchy() {}

    
}
