import UIKit

class SettingsViewController: UIViewController {

    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    var presenter: SettingsOutputViewProtocol?
    @IBOutlet weak var tableView: UITableView!
    var viewObjects = [[CashFlowTableViewCellViewObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension SettingsViewController: SettingsInputViewProtocol {
    
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]]) {
        self.viewObjects = viewObjects
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewObjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewObjects[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewObject.reuseIdentifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: viewObject, indexPath: indexPath)
        return cell
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        return viewObject.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewObject = viewObjects[indexPath.section][indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectRow(viewObject)
    }
}
