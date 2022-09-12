import UIKit

class ProfileController: UITableViewController, ConfigureView {
    // MARK: - Properties
    
    
    // MARK: - ConfigureView
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        viewHierarchy()
    }
    
    func viewSettings() {
        navigationItem.title = "Profile"
        view.backgroundColor = .systemPink
        tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
    }
    
    func viewHierarchy() {
        
    }
    
    
    // MARK: - Methods
    
        
}


// MARK: - Extension
extension ProfileController {
    // configure number of cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // configure cell as TweetCell()
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier, for: indexPath) as! TweetCell
        return cell
    }
    
    // configure cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
    
    
    
}
