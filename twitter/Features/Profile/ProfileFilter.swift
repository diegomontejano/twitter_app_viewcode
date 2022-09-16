import UIKit

class ProfileFilter: UIView, DMConfigureView {
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
        collectionView.register(ProfileFilterCell.self, forCellWithReuseIdentifier: ProfileFilterCell.identifier)
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
extension ProfileFilter: UICollectionViewDataSource {
    // configure cell as ProfileFilterCell()
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileFilterCell.identifier, for: indexPath) as! ProfileFilterCell
        return cell
    }
    
    // configure number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
}


// MARK: - Extension UICollectionViewDelegate
extension ProfileFilter: UICollectionViewDelegate {
    
}


// MARK: - Extension UICollectionViewDelegateFlowLayout
extension ProfileFilter: UICollectionViewDelegateFlowLayout {
    // configure cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    // configure space between items in cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
