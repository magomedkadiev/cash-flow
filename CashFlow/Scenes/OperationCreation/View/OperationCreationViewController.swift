import UIKit

class OperationCreationViewController: UIViewController {

    var presenter: OperationCreationOutputViewProtocol?
    var viewObjects = [[CashFlowTableViewCellViewObject]]()

    @IBOutlet weak var tableView: UITableView!
    
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
    }
}

extension OperationCreationViewController: OperationCreationInputViewProtocol {
    
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]]) {
        self.viewObjects = viewObjects
    }
}
