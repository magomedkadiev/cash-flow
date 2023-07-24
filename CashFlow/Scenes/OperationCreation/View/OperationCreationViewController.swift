import UIKit

class OperationCreationViewController: UIViewController {
    
    var presenter: OperationCreationOutputViewProtocol?
    var viewObjects: [[CashFlowTableViewCellViewObject]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var storedViewObjects: [CashFlowTableViewCellViewObject] = [] {
        willSet {
            if storedViewObjects.count > 0 {
                print(newValue)
            }
        }
    }
    
//    var categoryViewObject: CashFlowTableViewCellViewObject?
//    var walletViewObject: CashFlowTableViewCellViewObject?

    @IBOutlet weak var tableView: UITableView!
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "OperationCreation", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension OperationCreationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewObjects[section]
        return section.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.section][indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier) as? CashFlowTableViewCellProtocol {
            cell.setup(with: viewObject, indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
}

extension OperationCreationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        return viewObject.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedViewObject = viewObjects[indexPath.section][indexPath.row]
        
        presenter?.eventItemSelected(selectedViewObject, storedViewObjects: storedViewObjects)
    }
}

extension OperationCreationViewController: OperationCreationInputViewProtocol {
    
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]]) {
        self.viewObjects = viewObjects
    }
}
