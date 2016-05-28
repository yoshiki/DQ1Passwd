public struct DQ1Passwd {
    private let magicCode = [
        0x88, 0xc4, 0x62, 0x31, 0x08, 0x84, 0x42, 0x21,
        0x98, 0xcc, 0xe6, 0x73, 0xa9, 0xc4, 0x62, 0x31,
        0x5a, 0xad, 0xc6, 0x63, 0xa1, 0xc0, 0x60, 0x30,
        0x38, 0x9c, 0x4e, 0xa7, 0xc3, 0xf1, 0x68, 0xb4,
        0xd0, 0x68, 0xb4, 0x5a, 0x2d, 0x06, 0x83, 0x51,
        0x20, 0x10, 0x08, 0x84, 0x42, 0xa1, 0x40, 0xa0,
        0xf9, 0xec, 0xf6, 0x7b, 0xad, 0xc6, 0xe3, 0x61,
        0x81, 0xd0, 0x68, 0xb4, 0xda, 0x6d, 0xa6, 0xd3,
        0xb2, 0xd9, 0xfc, 0xfe, 0xff, 0xef, 0x67, 0x23,
        0x34, 0x1a, 0x0d, 0x96, 0x4b, 0x35, 0x8a, 0x45,
        0xaa, 0xd5, 0x7a, 0x3d, 0x8e, 0x47, 0xb3, 0x49,
        0xa1, 0x40, 0xa0, 0x50, 0xa8, 0xd4, 0xea, 0x75,
        0xa0, 0xd0, 0x68, 0xb4, 0x5a, 0xad, 0xc6, 0x63,
        0x7e, 0xbf, 0xcf, 0xf7, 0x6b, 0xa5, 0xc2, 0x61
    ]
    
    private let kanaForPass = [
        "あ","い","う","え","お",
        "か","き","く","け","こ",
        "さ","し","す","せ","そ",
        "た","ち","つ","て","と",
        "な","に","ぬ","ね","の",
        "は","ひ","ふ","へ","ほ",
        "ま","み","む","め","も",
        "や","ゆ","よ",
        "ら","り","る","れ","ろ","わ",
        "が","ぎ","ぐ","げ","ご",
        "ざ","じ","ず","ぜ","ぞ",
        "だ","ぢ","づ","で","ど",
        "ば","び","ぶ","べ","ぼ"
    ]
    
    public func encode(status: Status, split: Bool) -> String {
        let codeOf8bit = generate8bitCode(status: status)
        let codeOf6bit = convert8BitTo6Bit(code: codeOf8bit)
        return stringify(data: codeOf6bit, split: split)
    }
    
    public func decode(spell: String) -> [String: Int] {
        return [:]
    }
    
    private func generate8bitCode(status: Status) -> [Int] {
        var code = [Int]()
        code.append(status.item2.index() << 4 | status.item1.index())
        code.append(status.uroko.index() << 7 | status.name2.index() << 1 | status.ring.index())
        code.append(status.exp >> 8)
        code.append(status.item6.index() << 4 | status.item5.index())
        code.append(status.key << 4 | status.herb)
        code.append(status.gold >> 8)
        code.append(status.weapon.index() << 5 | status.armor.index() << 2 | status.shield.index())
        code.append(status.checksum << 5 & 0x80 | status.oujyo.index() << 6 | status.name4.index())
        code.append(status.item8.index() << 4 | status.item7.index())
        code.append(status.name1.index() << 2 | status.gorem.index() << 1 | status.checksum >> 1 & 0x01)
        code.append(status.gold & 0xff)
        code.append(status.item4.index() << 4 | status.item3.index())
        code.append(status.checksum << 7 & 0x80 | status.death.index() << 6 | status.name3.index())
        code.append(status.exp & 0xff)
        code.append(0)
    
        // calc check code
        for i in 0..<14 {
            var wc = code[i]
            for j in 0..<8 {
                if wc & 0x80 != 0 {
                    code[14] ^= magicCode[i << 3 + j]
                }
                wc <<= 1
            }
        }
        return code
    }
    
    private func convert8BitTo6Bit(code: [Int]) -> [Int] {
        var data = [Int](repeating: 0, count: 20)
        var dataLen = 0
        for i in 0..<15 {
            if i % 3 == 0 {
                data[dataLen] = code[i] >> 2 & 0x3f
                dataLen += 1
                data[dataLen] = code[i] << 4 & 0x30
            } else if i % 3 == 1 {
                data[dataLen] |= code[i] >> 4 & 0x0f
                dataLen += 1
                data[dataLen] = code[i] << 2 & 0x3c
            } else if i % 3 == 2 {
                data[dataLen] |= code[i] >> 6 & 0x03
                dataLen += 1
                data[dataLen] = code[i] & 0x3f
                dataLen += 1
            }
        }
    
        // encrypt
        var a = 0
        for i in (0...19).reversed() {
            data[i] = (data[i] + a + 4) & 0x3f
            a = data[i]
        }

        return data
    }
    
    private func stringify(data: [Int], split: Bool) -> String {
        var password = ""
        for i in (0...19).reversed() {
            if split && (i == 2 || i == 7 || i == 14) {
                password += " "
            }
            password += kanaForPass[data[i]]
        }
        return password
    }
}