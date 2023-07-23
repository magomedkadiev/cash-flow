import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("fewfwe")
        self.delegate = self
    }

}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let selectedBarItemTag = viewController.tabBarItem.tag
        
        if selectedBarItemTag == TabControllersConst.add {
            let storyboard = UIStoryboard(name: "OperationCreation", bundle: nil)
            if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController {
                self.present(navigationController, animated: true)
                return false
            }
        }
        return true
    }
}

private struct TabControllersConst {
    static let operations = 0
    static let add = 1
    static let settings = 2
}
