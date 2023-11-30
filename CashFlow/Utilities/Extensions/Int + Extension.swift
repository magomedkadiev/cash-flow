import Foundation

extension Int {
    func toMoneyStyle() -> String {
        return self.formatted(.number.locale(.init(identifier: "ru_RU"))) + " ₽"
    }
}
