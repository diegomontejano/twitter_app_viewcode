import Foundation
import UIKit

class TweetController: UITableViewController {
    // MARK: - Properties
    
    
    // MARK: - ConfigureView
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Tweet"
        view.backgroundColor = .systemOrange
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods
    
    
}
