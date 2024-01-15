import UIKit

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryListOutputViewProtocol?
    var viewObjects = [CategoryListViewObject]()
    weak var handler: CategoryListSelectionHandler?
    
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!

    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "CategoryList", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
     
    @IBAction func addBarButtonItemTapped(_ sender: UIBarButtonItem) {
        presenter?.addButtonTapped()
    }
}

extension CategoryListViewController: CategoryListInputViewProtocol {
    
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        guard let viewObjects = viewObjects as? [CategoryListViewObject] else { return }
        self.viewObjects = viewObjects
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didSelectHandler(_ viewObject: CategoryListViewObject) {
        self.handler?.updateSelectedCategoryObject(viewObject)
    }
    
    func hideBarButtonItemIfNedeed(_ value: Bool) {
        addBarButtonItem.isHidden = value
    }
}

extension CategoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var viewObjectsCount = viewObjects.count
        
        for viewObject in viewObjects {
            viewObjectsCount += viewObject.subCategories.count
        }
        
        return viewObjectsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject: CategoryListViewObject?

        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        let mutableIndexPath = IndexPath(row: row, section: section)
        

        if row == 0 {
            viewObject = viewObjects[section]
        } else {
            viewObject = viewObjects[section].subCategories[row - 1]
        }

        if let cell = tableView.dequeueReusableCell(withIdentifier: viewObject!.reuseIdentifier) as? CashFlowTableViewCellProtocol {
            
            if let headerCell = cell as? CategoryListTableViewCell {
                headerCell.handler = self
            }
            
            cell.setup(with: viewObject!, indexPath: mutableIndexPath)
            return cell as? UITableViewCell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
}

extension CategoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        let indexPath = IndexPath(row: row, section: section)
        
        presenter?.didSelectItemEvent(viewObjects, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        if row == 0 {
            return viewObjects[section].cellHeight
        }
        
        return viewObjects[section].isExpanded ? 0 : viewObjects[section].cellHeight
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let viewObject = viewObjects[indexPath.section].subCategories[indexPath.row]
        
        switch editingStyle {
        case .delete:
            presenter?.removeItemEvent(viewObject)
            
            self.viewObjects[indexPath.section].subCategories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            if viewObjects[indexPath.section].subCategories.isEmpty {
                self.viewObjects.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
            }
        default:
            return
        }
    }
}

extension CategoryListViewController: CategoryListHeaderSelectionHandler {
    
    func expandedSection(_ button: UIButton) {
        let section = button.tag
        let isExpanded = viewObjects[section].isExpanded
        
        viewObjects[section].isExpanded = !isExpanded
        let indices = getHeaderIndices()
        
        let start = indices[section]
        let end = start + viewObjects[section].subCategories.count
        
        tableView.beginUpdates()
        for i in start ..< end + 1 {
            tableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .automatic)
        }
        tableView.endUpdates()
    }
}

extension CategoryListViewController: CategoryCreationFinishHandler {
    
    func finishHandled() {
        presenter?.fetchAllCategories()
    }
}

extension CategoryListViewController {
    
    func getSectionIndex(_ row: NSInteger) -> Int {
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                return i
            }
        }
        
        return -1
    }
    
    func getRowIndex(_ row: NSInteger) -> Int {
        var index = row
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                index -= indices[i]
                break
            }
        }
        
        return index
    }
    
    func getHeaderIndices() -> [Int] {
        var index = 0
        var indices: [Int] = []
        
        for viewObject in viewObjects {
            indices.append(index)
            index += viewObject.subCategories.count + 1
        }
        
        return indices
    }
}
