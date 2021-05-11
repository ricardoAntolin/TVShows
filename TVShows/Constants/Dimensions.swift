import Foundation
import CoreGraphics

public struct Dimensions {
    public struct Margin {
        /// 2
        public static let x3Small: CGFloat = 2
        /// 4
        public static let x2Small: CGFloat = 4
        /// 8
        public static let xSmall: CGFloat = 8
        /// 16
        public static let small: CGFloat = 16
        /// 24
        public static let medium: CGFloat = 24
        /// 32
        public static let large: CGFloat = 32
        /// 40
        public static let xLarge: CGFloat = 40
        /// 48
        public static let x2Large: CGFloat = 48
        /// 56
        public static let x3Large: CGFloat = 56
        /// 64
        public static let x4Large: CGFloat = 64
        /// 72
        public static let x5Large: CGFloat = 72
        /// 80
        public static let x6Large: CGFloat = 80
    }

    public struct Size {
        /// 2
        public static let x4Small: CGFloat = 2
        /// 4
        public static let x3Small: CGFloat = 4
        /// 8
        public static let x2Small: CGFloat = 8
        /// 12
        public static let xSmall: CGFloat = 12
        /// 16
        public static let small: CGFloat = 16
        /// 24
        public static let medium: CGFloat = 24
        /// 32
        public static let large: CGFloat = 32
        /// 40
        public static let xLarge: CGFloat = 40
        /// 48
        public static let x2Large: CGFloat = 48
        /// 56
        public static let x3Large: CGFloat = 56
        /// 64
        public static let x4Large: CGFloat = 64
        /// 72
        public static let x5Large: CGFloat = 72
        /// 80
        public static let x6Large: CGFloat = 80
        /// 88
        public static let x7Large: CGFloat = 88
        /// 96
        public static let x8Large: CGFloat = 96
        /// 104
        public static let x9Large: CGFloat = 104
        /// 152
        public static let x15Large: CGFloat = 152
    }

    public struct Radius {
        /// 2
        public static let x4Small: CGFloat = 2
        /// 4
        public static let x3Small: CGFloat = 4
        /// 8
        public static let x2Small: CGFloat = 8
        /// 12
        public static let xSmall: CGFloat = 12
        /// 16
        public static let small: CGFloat = 16
        /// 24
        public static let medium: CGFloat = 24
        /// 32
        public static let large: CGFloat = 32
    }

    public struct AnimationDuration {
        /// 100ms
        public static let veryFast: TimeInterval = 0.1
        /// 300ms
        public static let fast: TimeInterval = 0.3
        /// 600ms
        public static let medium: TimeInterval = 0.6
        /// 900ms
        public static let slow: TimeInterval = 0.9
    }

    public struct Opacity {
        /// 0.08
        public static let xSmall: Double = 0.2
        /// 0.16
        public static let medium: Double = 0.4
        /// 0.24
        public static let large: Double = 0.8
        /// 1
        public static let full: Double = 1
    }
}
