import XCTest
@testable import DQ1Passwd

class DQ1PasswdTests: XCTestCase {
	func testDQ1Passwd() {
        let status = Status(
            name1: .Num0,
            name2: .Num0,
            name3: .Num0,
            name4: .Num0,
            item1: .Nothing,
            item2: .Nothing,
            item3: .Nothing,
            item4: .Nothing,
            item5: .Nothing,
            item6: .Nothing,
            item7: .Nothing,
            item8: .Nothing,
            gold: 0, // 0-65535 ゴールド
            exp: 10000,  // 0-65535 けいけんち
            key: 1,      // 0-6 所持かぎ数
            herb: 1,     // 0-6 所持やくそう数
            weapon: Weapon(rawValue: "ロトのつるぎ")!,
            armor: Armor(rawValue: "ロトのよろい")!,
            shield: Shield(rawValue: "みかがみのたて")!,
            uroko: true, // りゅうのうろこを身に付けたことがある
            oujyo: true, // 王女を救出済
            gorem: true, // ゴーレムを討伐済
            ring: true,  // せんしのゆびわを装備してる
            death: true, // しのくびかざりを発見済
            checksum: 1  // 0-7 チェックサム用
        )
        let result = DQ1Passwd().encode(status: status, split: false)
        XCTAssertTrue(
            result == "へめらひまもきさそてさせつはまもせにめよ",
            "Password correct check"
        )
	}

}
extension DQ1PasswdTests {
	static var allTests : [(String, (DQ1PasswdTests) -> () throws -> Void)] {
		return [
			("testDQ1Passwd", testDQ1Passwd),
		]
	}
}
