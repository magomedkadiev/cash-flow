import Foundation

class CategoryCreationInitializer: NSObject {
    
    @IBOutlet weak var viewController: CategoryCreationViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = CategoryCreationConfigurator()
        configurator.configure(viewController)
    }
}
