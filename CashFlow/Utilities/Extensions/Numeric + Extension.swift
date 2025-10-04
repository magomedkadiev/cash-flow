import Foundation

import Foundation

extension Numeric {
    
    func groupedFormStyle() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3
        formatter.maximumFractionDigits = 0
        return formatter.string(for: self) ?? "\(self)"
    }
}
