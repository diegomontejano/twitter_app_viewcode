import UIKit

class ProfileFilterView: UIView, DMConfigureView {
    // MARK: - Properties
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    func configureView() {
        collectionView.register(ProfileFilterCollectionViewCell.self, forCellWithReuseIdentifier: ProfileFilterCollectionViewCell.identifier)
        
        let initProfileFilter = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: initProfileFilter, animated: true, scrollPosition: .left)
    }
    
    func configureViewConstraints() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


// MARK: - Extension UICollectionViewDataSource
extension ProfileFilterView: UICollectionViewDataSource {
    // configure cell as ProfileFilterCollectionViewCell()
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileFilterCollectionViewCell.identifier, for: indexPath) as! ProfileFilterCollectionViewCell
        
        // update cell.profileFilter
        let profileFilter = ProfileFilter(rawValue: indexPath.row)
        cell.profileFilter = profileFilter
        return cell
    }
    
    // configure number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileFilter.allCases.count
    }
}


// MARK: - Extension UICollectionViewDelegateFlowLayout
extension ProfileFilterView: UICollectionViewDelegateFlowLayout {
    // configure cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let profileFilterCount = CGFloat(ProfileFilter.allCases.count)
        return CGSize(width: frame.width / profileFilterCount, height: frame.height)
    }
    
    // configure space between the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
