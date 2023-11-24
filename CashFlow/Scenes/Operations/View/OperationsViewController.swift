import UIKit

class OperationsViewController: UIViewController {

    var presenter: OperationsOutputViewProtocol?
    
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!

    var operationSectionObjects = [OperationSectionObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupRefreshControll()
    }
    
    private func setupRefreshControll() {
        refreshControl.addTarget(self, action: #selector(refreshingHasStarted(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func refreshingHasStarted(sender: UIRefreshControl) {
        presenter?.eventBeginFerfeshing()
        // TODO: make it without delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.refreshControl.endRefreshing()
        })
    }
}


extension OperationsViewController: OperationsInputViewProtocol {
    
    func showInfo(_ operationSectionObjects: [OperationSectionObject]) {
        self.operationSectionObjects = operationSectionObjects
        self.tableView.reloadData()
    }
}

extension OperationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        return operationSectionObjects[section].date.toString()
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
