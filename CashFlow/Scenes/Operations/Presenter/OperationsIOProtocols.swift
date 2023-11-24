import Foundation

protocol OperationsInputViewProtocol: AnyObject {
    func showInfo(_ operationSectionObjects: [OperationSectionObject])
}

protocol OperationsOutputViewProtocol {
    func viewDidLoad()
    func fetchAllOperations()
    func eventBeginFerfeshing()
}
