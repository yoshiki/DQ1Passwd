# DQ1Passwd

DQ1Passwd allows you to create a spell of restoration(ふっかつのじゅもん) in the Famicom(and maybe MSX versions) of Dragon Quest.

- [x] Linux Ready
- [x] Swift 3.0 Ready(DEVELOPMENT-SNAPSHOT-2016-05-09-a)
- [x] Encoding status(convert a status to a spell)
- [ ] Decoding status(convert a spell to a status)

# Usage

```Swift
let status = Status(
    name1: .To,
    name2: .Nn,
    name3: .Nu,
    name4: .Ra,
    item1: .Torch,
    item2: .FairyWater,
    item3: .Wings,
    item4: .Nothing,
    item5: .Nothing,
    item6: .Nothing,
    item7: .Nothing,
    item8: .Nothing,
    gold: 65535, // 0-65535 ゴールド
    exp: 65535,  // 0-65535 けいけんち
    key: 6,      // 0-6 所持かぎ数
    herb: 6,     // 0-6 所持やくそう数
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
print(result) // ににるゆわわまぼえくうかけりざぞづばほれ
```

# Special Thanks to

- http://www.imasy.or.jp/~yotti/dq-passwd.html
- http://dqff.sakura.ne.jp/dq1fc/password/tool.html
- http://koredouyo.s355.xrea.com/
- http://zebratch.blog.so-net.ne.jp/2011-05-26-1

Some links are dead link...
