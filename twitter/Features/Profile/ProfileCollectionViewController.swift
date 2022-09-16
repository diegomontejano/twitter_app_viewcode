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
        // register TweetCollectionViewCell() and ProfileHeaderCollectionView()
        collectionView.register(TweetCollectionViewCell.self, forCellWithReuseIdentifier: TweetCollectionViewCell.identifier)
        collectionView.register(ProfileHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderCollectionView.identifier)
    }
    
    func configureNavigationItem() {
        navigationController?.navigationBar.isHidden = true
    }
}


// MARK: - Extension UICollectionViewDelegateFlowLayout
extension ProfileCollectionViewController: UICollectionViewDelegateFlowLayout {
    // configure cell as TweetCollectionViewCell()
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // send selected tweet in this collection to TweetCollectionViewCell().tweet
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TweetCollectionViewCell.identifier, for: indexPath) as! TweetCollectionViewCell
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
}


// MARK: - Extension ProfileCollectionViewHeader
extension ProfileCollectionViewController {
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
