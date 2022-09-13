import UIKit

class ExploreController: UIViewController, DMConfigureView {
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
    }
    
    func configureViewConstraints() {
        
    }
}
