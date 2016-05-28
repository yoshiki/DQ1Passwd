import Foundation

public struct Status {
    public var name1: NameChar
    public var name2: NameChar
    public var name3: NameChar
    public var name4: NameChar
    public var item1: Item
    public var item2: Item
    public var item3: Item
    public var item4: Item
    public var item5: Item
    public var item6: Item
    public var item7: Item
    public var item8: Item
    public var gold: Int      // 0-65535 ゴールド 1000
    public var exp: Int       // 0-65535 けいけんち 1000
    public var key: Int       // 0-6 所持しているかぎの数
    public var herb: Int      // 0-6 所持しているやくそうの数
    public var weapon: Weapon
    public var armor: Armor
    public var shield: Shield
    public var uroko: Bool    // りゅうのうろこを身に付けたことがある
    public var oujyo: Bool    // 王女を救出済
    public var gorem: Bool    // ゴーレムを討伐済
    public var ring: Bool     // せんしのゆびわを装備してる
    public var death: Bool    // しのくびかざりを発見済
    public var checksum: Int  // 0-7 チェックサム用
}

extension Bool {
    public func index() -> Int {
        return (self) ? 1 : 0
    }
}
