import UIKit
import SnapshotTesting

extension SnapshotTest {
    static var imageConfig: ViewImageConfig { ViewImageConfig.iPhoneX }

    public static var imageConfigBottomInset: CGFloat { imageConfig.safeArea.bottom }
    public static var imageConfigSize: CGSize? { imageConfig.size }

    public static func fixedSizeImage(
        withHeight height: CGFloat?
    ) -> SnapshotTesting.Snapshotting<UIViewController, UIImage> {
        return .image(
            on: imageConfig,
            size: CGSize(
                width: imageConfigSize!.width,
                height: height ?? imageConfigSize!.height))
    }

    public static var fixedSizeImageInKeyWindow: SnapshotTesting.Snapshotting<UIViewController, UIImage> {
        return .image(drawHierarchyInKeyWindow: true, size: imageConfigSize!)
    }
}
