import UIKit

class MessagesViewController: UIViewController, DMConfigureView {
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureViewConstraints()
    }

    // MARK: - Methods
    func configureView() {
        navigationItem.title = "Messages"
        view.backgroundColor = .systemOrange
    }
    
    func configureViewConstraints() {
        // code here
    }
}
