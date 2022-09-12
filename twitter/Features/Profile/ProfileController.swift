import UIKit

class ProfileController: UICollectionViewController, DMConfigureCollectionView {
    // MARK: - Properties
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    

    // MARK: - Methods
    func configureCollectionView() {
        navigationItem.title = "Profile"
        collectionView.backgroundColor = .systemPink
    }
    
        
}
