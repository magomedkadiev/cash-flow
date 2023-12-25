import UIKit

class CategoryCreationViewController: UIViewController {
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "CategoryCreation", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
