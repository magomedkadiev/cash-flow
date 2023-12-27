import UIKit

class CategoryListHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var headerTextLabel: UILabel!
    
    weak var handler: CategoryListHeaderSelectionHandler?
    
    func configure(title: String, section: Int) {
        headerTextLabel.text = title
        headerButton.tag = section
    }
        
    func rotateImage(_ expanded: Bool) {
        if expanded {
            headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } else {
            headerButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
        }
    }

    @IBAction func headerButtonDidTap(_ sender: UIButton) {
        handler?.expandedSection(sender)
    }
}