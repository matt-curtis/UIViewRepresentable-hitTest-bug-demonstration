# UIViewRepresentable hitTest bug demonstration

Demonstrates how SwiftUI ignores UIKit's hit-testing methods by creating a UIView that has isUserInteractionEnabled set to false. The UIViewRepresentable still blocks touches to the SwiftUI content below it.

Filed as Apple's bug tracker as FB9818366. [OpenRadar](https://openradar.appspot.com/radar?id=5006201888702464). [Twitter thread of me complaining about this problem.](https://twitter.com/mattxcurtis/status/1473543903232118787)

# Context

Problem:

SwiftUI doesn't respect the hit-testing preferences of the UIViews inside UIViewRepresentables.

UIViews have several ways they can react to hit-testing, primarily:

- UIView.isUserInteractionEnabled
- UIView.point(inside:event:)
- UIView.hitTest(_:event:)

While UIViewRepresentable will let you embed a UIView in SwiftUI content, SwiftUI completely ignores the inner UIView's hit-testing preferences, and instead treats the entire region of space the UIViewRepresentable takes up as a fully hit-testable area, which means the UIViewRepresentable blocks all touches to any SwiftUI content below it.

Steps to reproduce:

The attached project demonstrates this issue with a UIViewRepresentable that creates a UIView that has isUserInteractionEnabled set to false. The UIViewRepresentable still blocks touches to the SwiftUI content below it.

Expected behavior:

SwiftUI should be take into account and respect the hit-testing preferences of the UIView content it lets you embed. Not taking this hit-testing into account makes it much harder to integrate UIKit content with SwiftUI content.

Workarounds:

Using SwiftUI's contentShape, or allowsHitTesting, can give you some ability to mitigate this problem, but they are no substitute for the flexibility of UIKit's built-in methods.
