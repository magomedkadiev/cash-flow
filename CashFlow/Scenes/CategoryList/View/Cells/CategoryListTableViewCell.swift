import UIKit

class CategoryListTableViewCell: UITableViewCell, CashFlowTableViewCellProtocol {

    @IBOutlet weak var checkMarkImageView: UIImageView!
    @IBOutlet weak var nameLabelText: UILabel!
    @IBOutlet weak var toogleButton: UIButton!
    @IBOutlet weak var leadingCategoryStackConstraint: NSLayoutConstraint!
    
    weak var handler: CategoryListHeaderSelectionHandler?
    
    func setup(with viewObject: CashFlowTableViewCellViewObject, indexPath: IndexPath) {
        guard let viewObject = viewObject as? CategoryListViewObject else {
            return
        }
        nameLabelText.text = viewObject.name
        checkMarkImageView.isHidden = !viewObject.isSelected
        
        toogleButton.tag = indexPath.section
        rotateImage(viewObject.isExpanded)     
        
        if indexPath.row == 0 {
            leadingCategoryStackConstraint.constant = 16
            toogleButton.isHidden = false
        } else {
            leadingCategoryStackConstraint.constant = 48
            toogleButton.isHidden = true
        }
    }
    
    func rotateImage(_ expanded: Bool) {
        if expanded {
            toogleButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } else {
            toogleButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
        }
    }
    
    @IBAction func toogleButtonTouched(_ sender: UIButton) {
        handler?.expandedSection(sender)
    }
    
}
