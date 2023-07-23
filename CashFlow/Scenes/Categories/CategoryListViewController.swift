import UIKit

class CategoryListViewController: UIViewController {

    static func controller() -> CategoryListViewController {
        let storyboard = UIStoryboard(name: "CategoryList", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CategoryListViewController") as! CategoryListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
