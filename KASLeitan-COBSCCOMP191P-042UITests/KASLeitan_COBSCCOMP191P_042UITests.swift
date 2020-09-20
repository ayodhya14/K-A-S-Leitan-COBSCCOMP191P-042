import XCTest


class KASLeitan_COBSCCOMP191P_042UITests: XCTestCase {

        func testPerformance() throws {
            if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
                measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                    XCUIApplication().launch()
                }
            }
        }


}
