import UIKit

class CategoryListViewController: UIViewController {
    
    let router: ApplicationRouter = Router()

    static func controller() -> CategoryListViewController {
        let storyboard = UIStoryboard(name: "CategoryList", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CategoryListViewController") as! CategoryListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension CategoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension CategoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewObject = OperationsWalletsViewObject()
        router.dismissCategoryListViewController(viewObject)
    }
}
