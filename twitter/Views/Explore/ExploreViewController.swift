import UIKit

class ExploreViewController: UIViewController, DMConfigureView {
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureViewConstraints()
    }
    
    // MARK: - Methods
    func configureView() {
        navigationItem.title = "Explore"
        view.backgroundColor = .systemPink
    }
    
    func configureViewConstraints() {
        // code here
    }
}
