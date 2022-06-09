import UIKit

class ConversationsController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Methods
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
    
    
}
