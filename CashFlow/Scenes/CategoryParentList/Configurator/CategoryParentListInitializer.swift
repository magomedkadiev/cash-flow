import Foundation

class CategoryParentListInitializer: NSObject {
    
    @IBOutlet weak var viewController: CategoryParentListViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = CategoryParentListConfigurator()
        configurator.configure(viewController)
    }
}
