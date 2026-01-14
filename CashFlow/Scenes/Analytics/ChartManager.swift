import Foundation
import SwiftUI
import Charts

struct MyView: View {
    @State private var selectedAmount: Double? = nil
    let cumulativeIncomes: [(category: String, range: Range<Double>)]
    init() {
        data.sort {
            $0.sum > $1.sum
        }

        var cumulative = 0.0
        self.cumulativeIncomes = data.map {
            let newCumulative = cumulative + Double($0.sum)
            let result = (category: $0.category.name, range: cumulative ..< newCumulative)
            cumulative = newCumulative
            return result
        }
    }
    
    var selectedCategory: OperationModel? {
        if let selectedAmount,
           let selectedIndex = cumulativeIncomes
            .firstIndex(where: { $0.range.contains(selectedAmount) }) {
            return data[selectedIndex]
        }
        return nil
    }

    
    var body: some View {
        if #available(iOS 17.0, *) {
            Chart(data, id: \.id) { element in
                SectorMark(
                    angle: .value("Count", element.sum),
                    innerRadius: .ratio(selectedCategory == element ? 0.5 : 0.6),
                    outerRadius: .ratio(selectedCategory == element ? 1.0 : 0.9),
                    angularInset: 3.0
                )
                .cornerRadius(6)
                .foregroundStyle(by: .value("Name", element.category.name))
                .opacity(selectedCategory == element ? 1.0 : 0.8)
                .annotation(position: .overlay) {
                    Text("\(element.sum)")
                        .font(selectedCategory == element ? .title : .headline)
                        .fontWeight(.bold)
                        .padding(5)
                        .background(Color.accentColor.opacity(0.1))
                }
                
                
            }
            .chartForegroundStyleScale(
                domain: data.map  { $0.category.name },
                range: chartColors
            )
            .chartLegend(position: .bottom, alignment: .center)
            .chartAngleSelection(value: $selectedAmount)
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    let frame = geometry[chartProxy.plotFrame!]
                    VStack(spacing: 0) {
                        Text(selectedCategory?.category.name ?? "")
                            .multilineTextAlignment(.center)
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .frame(width: 120, height: 80)
                        Text("\(selectedCategory?.sum ?? 0)")
                            .font(.title.bold())
                            .foregroundColor((selectedCategory != nil) ? .primary : .clear)
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
            }
            .frame(height: 350)
            Spacer()
        }
    }
    var data: [OperationModel] = [
        .init(id: UUID().uuidString, type: .expense, category: CategoryPO(id: "", name: "Атомобиль", parentID: "", subCategories: []), sum: 100, date: Date(), comment: ""),
        .init(id: UUID().uuidString, type: .expense, category: CategoryPO(id: "", name: "Еда вне дома", parentID: "", subCategories: []), sum: 200, date: Date(), comment: ""),
        .init(id: UUID().uuidString, type: .expense, category: CategoryPO(id: "", name: "Здоровье", parentID: "", subCategories: []), sum: 300, date: Date(), comment: "")
    ]

}

let chartColors: [Color] = [
    Color(red: 0.55, green: 0.83 , blue: 0.78),
    Color(red: 1.00, green: 1.00 , blue: 0.70),
    Color(red: 0.75, green: 0.73 , blue: 0.85),
    Color(red: 0.98, green: 0.50 , blue: 0.45),
    Color(red: 0.50, green: 0.69 , blue: 0.83),
    Color(red: 0.99, green: 0.71 , blue: 0.38),
    Color(red: 0.70, green: 0.87 , blue: 0.41),
    Color(red: 0.99, green: 0.80 , blue: 0.90),
    Color(red: 0.85, green: 0.85 , blue: 0.85),
    Color(red: 0.74, green: 0.50 , blue: 0.74),
    Color(red: 0.80, green: 0.92 , blue: 0.77),
    Color(red: 1.00, green: 0.93 , blue: 0.44)
]


struct OperationModel: Identifiable, Equatable {
    static func == (lhs: OperationModel, rhs: OperationModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String
    var type: OperationType
    var category: CategoryPO
    var sum: Int
    var date: Date
    var comment: String
    
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

extension View {
    
    func injectIn(view: UIView) {
        let controller = UIHostingController(rootView: self)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear
        view.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func injectIn(controller vc: UIViewController) {
        let controller = UIHostingController(rootView: self)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear
        vc.view.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            controller.view.topAnchor.constraint(equalTo: vc.view.topAnchor),
            controller.view.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            controller.view.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)
        ])
    }
}
