import UIKit

class OperationCreationViewController: UIViewController {

    var presenter: OperationCreationOutputViewProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    fileprivate func cornerRadiusFor(view: UIView, for indexPath: IndexPath) {
        let cornerRadius = 20
        var corners: UIRectCorner = []
        
        
        switch indexPath.row {
        case 1:
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        case 2:
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        default:
            return
        }

//        if indexPath.row == 0 {
//            corners.update(with: .topLeft)
//            corners.update(with: .topRight)
//        }
//
//        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
//            corners.update(with: .bottomLeft)
//            corners.update(with: .bottomRight)
//        }

        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        view.layer.mask = maskLayer
    }
}

extension OperationCreationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "operationCreationHeaderTableViewCell") as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "saveButtonTableViewCell") as? SaveButtonTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTableViewCell") as? CategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cornerRadiusFor(view: cell.categoryBackgroundView, for: indexPath)
            
            return cell
        }
    }
}

extension OperationCreationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 150
        case 3: return 80
        default: return 60
        }
    }
}

extension OperationCreationViewController: OperationCreationInputViewProtocol {
    
}
