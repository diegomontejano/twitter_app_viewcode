import UIKit

class TweetCollectionViewController: UICollectionViewController, DMConfigureCollectionView {
    // MARK: - Properties


    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }


    // MARK: - Methods
    func configureCollectionView() {
        navigationItem.title = "Tweet"
        collectionView.backgroundColor = .systemOrange
    }
}
