import XCTest

protocol UITest: AnyObject {

    var application: XCUIApplication! { get }
}

// MARK: - Interaction
extension UITest {
    @discardableResult
     func assert<T: PageObject>(exists pageObject: T,
                                      waitFor seconds: TimeInterval? = 60.0,
                                      file: StaticString = #file,
                                      line: UInt = #line,
                                      retryBlock: (() -> Void)? = nil) -> XCUIElement? {
        guard element(for: pageObject).waitForExistence(timeout: seconds ?? 0.0) else {
            if let retryBlock = retryBlock {
                retryBlock()
            } else {
                XCTFail("The UI \(pageObject.identifier) element can not be found", file: file, line: line)
            }
            return nil
        }

        XCTAssertTrue(true)

        return element(for: pageObject)
    }

     func assertNot<T: PageObject>(exists pageObject: T,
                                         file: StaticString = #file,
                                         line: UInt = #line) {
        guard !element(for: pageObject).exists else {
            XCTFail("The UI \(pageObject.identifier) element exists", file: file, line: line)
            return
        }

        XCTAssertTrue(true)
    }

     func tap<T: PageObject>(on pageObject: T) {
        assert(exists: pageObject)
        element(for: pageObject).tap()
    }

     func tapUnhittable<T: PageObject>(on pageObject: T) {
        assert(exists: pageObject)
        element(for: pageObject).coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)).tap()
    }

     func tapIfExists<T: PageObject>(on pageObject: T) {
        if element(for: pageObject).exists {
            tap(on: pageObject)
        }
    }

     func tapAtCenter<T: PageObject>(of pageObject: T,
                                           offset: CGVector = .zero) {
        let elementCoordinate = element(for: pageObject).coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let elementMaxX = element(for: pageObject).frame.maxX
        let elementMaxY = element(for: pageObject).frame.maxY

        let centerCoordinate = elementCoordinate.withOffset(CGVector(dx: elementMaxX/2, dy: elementMaxY/2))
        let coordinate = centerCoordinate.withOffset(offset)

        coordinate.tap()
    }

     func swipe<T: PageObject>(direction: SwipeDirection,
                                     velocity: XCUIGestureVelocity = .default,
                                     pageObject: T) {
        switch direction {

        case .up:
            element(for: pageObject).swipeUp(velocity: velocity)
        case .down:
            element(for: pageObject).swipeDown(velocity: velocity)
        case .right:
            element(for: pageObject).swipeRight(velocity: velocity)
        case .left:
            element(for: pageObject).swipeLeft(velocity: velocity)
        }
    }

     func drag<T: PageObject, U: PageObject>(from initialPageObject: T,
                                                   to targetPageObject: U,
                                                   fromHoldDuration: TimeInterval = 0.0,
                                                   targetHoldDuration: TimeInterval = 0.0,
                                                   velocity: XCUIGestureVelocity = .default) {
        let fromCoordinate = element(for: initialPageObject).coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let toCoordinate = element(for: targetPageObject).coordinate(withNormalizedOffset: CGVector(dx: 0, dy: -0.5))
        fromCoordinate.press(forDuration: fromHoldDuration,
                             thenDragTo: toCoordinate,
                             withVelocity: velocity,
                             thenHoldForDuration: targetHoldDuration)
    }

     func drag<T: PageObject>(from initialPageObject: T,
                                    fromOffset: CGVector = .zero,
                                    targetOffset: CGVector,
                                    fromHoldDuration: TimeInterval = 0.0,
                                    targetHoldDuration: TimeInterval = 0.0,
                                    velocity: XCUIGestureVelocity = .default) {
        let fromCoordinate = element(for: initialPageObject).coordinate(withNormalizedOffset: fromOffset)
        let toCoordinate = element(for: initialPageObject).coordinate(withNormalizedOffset: targetOffset)

        fromCoordinate.press(forDuration: fromHoldDuration,
                             thenDragTo: toCoordinate,
                             withVelocity: velocity,
                             thenHoldForDuration: targetHoldDuration)
    }

     func press(deviceButton: XCUIDevice.Button) {
        XCUIDevice.shared.press(deviceButton)
    }

     func type<T: PageObject>(_ text: String, on pageObject: T) {
        element(for: pageObject).typeText(text)
    }

     func removeText<T: PageObject>(in pageObject: T) {
        guard let currentTextFieldValue = element(for: pageObject).value as? String else {
            XCTFail("There's no text for \(pageObject.identifier)")
            return
        }
        let removingText = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextFieldValue.count)

        type(removingText, on: pageObject)
    }

     func replaceText<T: PageObject>(in pageObject: T, with text: String) {
        removeText(in: pageObject)
        type(text, on: pageObject)
    }

    private func element<T: PageObject>(for pageObject: T) -> XCUIElement {
        switch (pageObject.identifier, pageObject.kind) {
        case (.text(let text), .cell):
            return application.cells[text]
        case (.text(let text), _):
            return application.element(with: text)
        case (.accessibility(let id), .other):
            return application.otherElements[id]
        case (.accessibility(let id), .button):
            return application.buttons[id]
        case (.accessibility(let id), .cell):
            return application.cells[id]
        case (.accessibility(let id), .image):
            return application.images[id]
        case (.accessibility(let id), .textField):
            return application.textFields[id]
        case (.accessibility(let id), .textView):
            return application.textViews[id]
        case (.accessibility(let id), .switch):
            return application.switches[id]
        case (.accessibility(let id), .tabBar):
            return application.tabBars[id]
        case (.accessibility(let id), .datePicker):
            return application.datePickers[id]
        case (.accessibility(let id), .pickerWheel):
            return application.pickerWheels[id]
        case (.accessibility(let id), .secureTextField):
            return application.secureTextFields[id]
        case (.accessibility(let id), .label):
            return application.staticTexts[id]
        }
    }
}

 enum SwipeDirection {
    case up
    case down
    case right
    case left
}

 extension XCUIElement {

    func element(with labelText: String) -> XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS %@", labelText)
        return staticTexts.matching(predicate).firstMatch
    }

    func labelContains(text: String) -> Bool {
        element(with: text).exists
    }

    func button(with text: String) -> XCUIElement {
        buttons.element(matching: NSPredicate(format: "label CONTAINS %@", text))
    }
}
