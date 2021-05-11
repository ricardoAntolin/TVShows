import SwiftUI
import SnapshotTesting
import XCTest

public protocol SnapshotTest {}

public extension SnapshotTest {
    func setRecordMode() {
        isRecording = true
    }

    func assert(
        swiftUIView: AnyView,
        height: CGFloat? = nil,
        record: Bool = false,
        waitFor: Double = 0.0,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line) {
        assertSnapshot(
            matching: UIHostingController(rootView: swiftUIView),
            as: .wait(
                for: waitFor,
                on: Self.fixedSizeImage(withHeight: height) as SnapshotTesting.Snapshotting<UIViewController, UIImage>
            ),
            record: record,
            file: file,
            testName: testName,
            line: line
        )
    }

    func assert<T: Codable>(
        encodable: T,
        record: Bool = false,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line) {
        assertSnapshot(
            matching: encodable,
            as: .json,
            record: record,
            file: file,
            testName: testName,
            line: line
        )
    }

    func assert(
        view: UIView,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let size = view.sizeThatFits(CGSize(width: 375.0, height: .infinity))
        let format = SnapshotTesting.Snapshotting<UIView, UIImage>.image(size: size)
        assertSnapshots(
            matching: view,
            as: [format],
            file: file,
            testName: testName,
            line: line
        )
    }

    func assert(
        dump: Any,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line) {
        assertSnapshot(
            matching: dump,
            as: .dump,
            file: file,
            testName: testName,
            line: line
        )
    }

    func assert(
        window: UIWindow,
        record: Bool = false,
        waitFor: Double = 0.0,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line) {
        assertSnapshot(
            matching: window,
            as: .wait(for: waitFor,
                      on: Snapshotting<UIView, UIImage>.image),
            record: record,
            file: file,
            testName: testName,
            line: line
        )
    }

    /*
     Takes a screenshot of the view controller passed into this function.
     The main difference here is that we are going to use the key window
     to render the view controller and therefore the output image will
     be closer to what we display in the final app.

     If you are having problems rendering rounded corners or shadows, try
     this method instead and see if the resulting screenshot better
     represents the view controller.
     */
    func assertUsingKeyWindow(
        viewController: UIViewController,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line) {
        assertSnapshot(
            matching: viewController,
            as: Self.fixedSizeImageInKeyWindow as SnapshotTesting.Snapshotting<UIViewController, UIImage>,
            file: file,
            testName: testName,
            line: line
        )
    }
}
