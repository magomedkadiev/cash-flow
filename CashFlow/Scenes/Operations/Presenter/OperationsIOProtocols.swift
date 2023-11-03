import Foundation

protocol OperationsInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [Dictionary<Date, [OperationViewObject]>.Element])
}

protocol OperationsOutputViewProtocol {
    func viewDidLoad()
    func fetchAllOperations()
    func eventBeginFerfeshing()
}
