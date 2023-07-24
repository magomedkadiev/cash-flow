import Foundation

class CategoryListInitializer: NSObject {
    
    @IBOutlet weak var viewController: CategoryListViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = CategoryListConfigurator()
        configurator.configure(with: viewController)
    }
    
}
