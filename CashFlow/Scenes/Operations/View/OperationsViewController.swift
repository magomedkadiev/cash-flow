import UIKit

class OperationsViewController: UIViewController {

    @IBOutlet weak var monthlyExpenseTextLabel: UILabel!
    @IBOutlet weak var monthlyIncomeTextLabel: UILabel!
    
    var presenter: OperationsOutputViewProtocol?
    
    private let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }()
    
    @IBOutlet weak var tableView: UITableView!

    var operationSectionObjects = [OperationSectionObject]()
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Operations", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.refreshControl = refreshControl
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    @objc func didPullToRefresh() {
        presenter?.eventBeginFerfeshing()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3,
                                      execute: {
            self.refreshControl.endRefreshing()
        })
    }
}

extension OperationsViewController: OperationsInputViewProtocol {
    
    func showInfo(_ operationSectionObjects: [OperationSectionObject], totalExpense: Int, totalIncome: Int) {
        self.operationSectionObjects = operationSectionObjects
        self.monthlyExpenseTextLabel.text = totalExpense.toMoneyStyle()
        self.monthlyIncomeTextLabel.text = totalIncome.toMoneyStyle()

        self.tableView.reloadData()
    }
}

extension OperationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let operationViewObject = operationSectionObjects[indexPath.section].operations[indexPath.row]
        presenter?.didSelectItemEvent(operationViewObject)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return operationSectionObjects[indexPath.section].operations[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}

extension OperationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionObject = operationSectionObjects[section]
        return sectionObject.date.toString() + "      " + sectionObject.balancePerDay.toMoneyStyle()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return operationSectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operationSectionObjects[section].operations.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let operation = operationSectionObjects[indexPath.section].operations[indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: operation.reuseIdentifier) as? CashFlowTableViewCellProtocol {
            cell.setup(with: operation, indexPath: indexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
        
    }
}

extension OperationsViewController: OperationCreationFinishHandler {
    
    func finishHandled() {
        presenter?.fetchAllOperations()
    }
}
