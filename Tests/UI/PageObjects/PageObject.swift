import XCTest

protocol PageObject {
    var kind: UIElement.Kind { get }
    var identifier: UIElement.Identifier { get }
}

enum UIElement {
    enum Identifier {
        case text(String)
        case accessibility(id: String)

        var rawValue: String {
            switch self {
            case .accessibility(let id): return id
            case .text(let text): return text
            }
        }
    }

    enum Kind {
        case button
        case cell
        case datePicker
        case image
        case label
        case pickerWheel
        case secureTextField
        case `switch`
        case textField
        case textView
        case other
        case tabBar
    }
}
