import UIKit

class ProfileCollectionViewController: UICollectionViewController, DMConfigureCollectionView {
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationItem()
    }
    
    // MARK: - Methods
    func configureCollectionView() {
        navigationItem.title = "Profile"
        // invert the color of the top icons (time, signal, wifi, battery)
        navigationController?.navigationBar.barStyle = .black
        
        collectionView.backgroundColor = .white
        // ignore safe area
        collectionView.contentInsetAdjustmentBehavior = .never
        // register FeedCollectionViewCell() and ProfileHeaderCollectionView()
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        collectionView.register(ProfileHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderCollectionView.identifier)
    }
    
    func configureNavigationItem() {
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - Extension UICollectionViewDelegateFlowLayout
extension ProfileCollectionViewController: UICollectionViewDelegateFlowLayout {
    // configure cell as FeedCollectionViewCell()
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
        return cell
    }
    
    // configure number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // configure cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    // configure header as ProfileHeaderCollectionView()
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeaderCollectionView.identifier, for: indexPath) as! ProfileHeaderCollectionView
        return header
    }
    
    // configure header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}
