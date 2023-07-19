import UIKit

class OperationCreationViewController: UIViewController {

    var presenter: OperationCreationOutputViewProtocol?
    var sections = [GroupedSection<Int, CashFlowTableViewCellViewObject>]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension OperationCreationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        return section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = sections[indexPath.section].rows[indexPath.row]
        
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
        let viewObject = sections[indexPath.section].rows[indexPath.row]
        return viewObject.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension OperationCreationViewController: OperationCreationInputViewProtocol {
    
    func showInfo(_ viewObject: [CashFlowTableViewCellViewObject]) {
        sections = GroupedSection.group(rows: viewObject, by: { $0.sectionItem })
        sections.sort { lhs, rhs in lhs.sectionItem < rhs.sectionItem }
        print(sections)
    }
}

struct GroupedSection<SectionItem : Hashable, RowItem> {

    var sectionItem : SectionItem
    var rows : [RowItem]

    static func group(rows : [RowItem], by criteria : (RowItem) -> SectionItem) -> [GroupedSection<SectionItem, RowItem>] {
        let groups = Dictionary(grouping: rows, by: criteria)
        return groups.map(GroupedSection.init(sectionItem:rows:))
    }

}
