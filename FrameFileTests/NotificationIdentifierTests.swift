import Foundation
import XCTest
@testable import FrameFile

final class NotificationIdentifierTests: XCTestCase {
    func testIdentifierIsStableAndNamespaced() {
        let id = UUID(uuidString: "00000000-0000-0000-0000-000000000042") ?? UUID()

        XCTAssertEqual(
            NotificationService.identifier(for: id),
            "framefile.reminder.00000000-0000-0000-0000-000000000042"
        )
    }
}
