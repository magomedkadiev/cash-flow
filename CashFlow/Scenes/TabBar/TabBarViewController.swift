import UIKit

class TabBarViewController: UITabBarController {
    
    let router: ApplicationRouter = Router()

    private let middleButtonDiameter: CGFloat = 42
    private var lastSelectedIndex: Int = 0
    
    private lazy var addImageView: UIImageView = {
        let addImageView = UIImageView()
        addImageView.image = UIImage(named: "Add")
        addImageView.tintColor = .white
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        return addImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setUpMiddleButton()
        setUpViewControllers()
    }
    
    private func setUpMiddleButton() {
        tabBar.addSubview(addImageView)

        NSLayoutConstraint.activate([
            addImageView.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            addImageView.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            addImageView.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            addImageView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
        ])
    }
    
    private func setUpViewControllers() {
        let operationsViewController = OperationsViewController.controller()
        operationsViewController.tabBarItem.title = "Операции"
        
        let stubViewController = UINavigationController()
        stubViewController.view.backgroundColor = .white
        
        let settingsViewController = SettingsViewController.controller()
        settingsViewController.tabBarItem.title = "Настройки"
        
        viewControllers = [operationsViewController, stubViewController, settingsViewController]
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if selectedIndex == 1 {
            router.openOperationCreationScreen(nil)
            selectedIndex = lastSelectedIndex
        }
        lastSelectedIndex = selectedIndex
    }
}
