import UIKit

class OperationsViewController: UIViewController {

    var presenter: OperationsOutputViewProtocol?
    
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    var viewObjects = [[CashFlowTableViewCellViewObject]]()
    
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
        self.performSegue(withIdentifier: "OperationCreationViewController", sender: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.refreshControl.endRefreshing()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OperationCreationViewController" {
           let _ = segue.destination as? OperationCreationViewController
        }
    }
}

extension OperationsViewController: OperationsInputViewProtocol {
    
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]]) {
        self.viewObjects = viewObjects
    }
}

extension OperationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        return viewObject.cellHeight
    }

}

extension OperationsViewController: UITableViewDataSource {
    
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
