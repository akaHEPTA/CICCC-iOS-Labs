
import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    let storeItemController = StoreItemController()
    
    var items = [StoreItem]()
    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            
            // set up query dictionary
            let query: [String: String] = [
                "term": searchTerm,
                "media": mediaType,
                "lang": "en_us",
                "limit": "50"
            ]
            
            // use the item controller to fetch items
            storeItemController.fetchItems(matching: query) { (items) in
                if let unWrapedItems: [StoreItem] = items {
                    self.items = unWrapedItems
                    // if successful, use the main queue to set self.items and reload the table view
                    // Main thread: Serial queue, to update UI
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else { // otherwise, print an error to the console
                    print("Error: Failed to unwrap the data returned.")
                }
            }
            
        }
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        // set label to the item's name
        cell.textLabel?.text = item.name
        // set detail label to the item's subtitle
        cell.detailTextLabel?.text = item.artist
        // reset the image view to the gray image
        cell.imageView?.image = UIImage(named: "gray")
        
        // initialize a network task to fetch the item's artwork
        let task = URLSession.shared.dataTask(with: item.artworkURL) { (data, response, error) in
            // if successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the
            if let data = data, let artwork = UIImage(data: data) {
                DispatchQueue.main.async {
                    cell.imageView?.image = artwork
                }
            }
        }
        
        // resume the task
        task.resume()
    }
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
