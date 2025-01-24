import UIKit

class AnalyticsViewController: UIViewController {
    
    static func controller() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Analytics", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }

    @IBOutlet weak var chartsBackgroundView: UIView!
    var chartsView: MyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chartsView = MyView()
        chartsView?.injectIn(view: chartsBackgroundView)
        chartsBackgroundView.backgroundColor = .clear
    }

}

