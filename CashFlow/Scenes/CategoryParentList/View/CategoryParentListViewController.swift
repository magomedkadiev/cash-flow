import UIKit

class CategoryParentListViewController: UIViewController {

    var presenter: CategoryParentListOutputViewProtocol?
    @IBOutlet weak var tableView: UITableView!
    var viewObjects = [CashFlowTableViewCellViewObject]()
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "CategoryParentList", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    } 

}

extension CategoryParentListViewController: CategoryParentListInputViewProtocol {
    
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        self.viewObjects = viewObjects
    }
}

extension CategoryParentListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier, for: indexPath) as? CashFlowTableViewCellProtocol else {
            return UITableViewCell()
        }
        cell.setup(with: viewObject, indexPath: indexPath)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
}

extension CategoryParentListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.row]
        return viewObject.cellHeight
    }
}
