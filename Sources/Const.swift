import Foundation

public enum DQSeries {
    case DQ1, DQ2
}

public protocol Entity {
    static func indexOf<T>(_ entity: T) -> Int
}

extension Entity {
    public func index() -> Int {
        return Self.indexOf(self)
    }
}

public enum NameChar: String {
    case Num0 = "０"
    case Num1 = "１"
    case Num2 = "２"
    case Num3 = "３"
    case Num4 = "４"
    case Num5 = "５"
    case Num6 = "６"
    case Num7 = "７"
    case Num8 = "８"
    case Num9 = "９"
    case A = "あ"
    case I = "い"
    case U = "う"
    case E = "え"
    case O = "お"
    case Ka = "か"
    case Ki = "き"
    case Ku = "く"
    case Ke = "け"
    case Ko = "こ"
    case Sa = "さ"
    case Si = "し"
    case Su = "す"
    case Se = "せ"
    case So = "そ"
    case Ta = "た"
    case Ti = "ち"
    case Tu = "つ"
    case Te = "て"
    case To = "と"
    case Na = "な"
    case Ni = "に"
    case Nu = "ぬ"
    case Ne = "ね"
    case No = "の"
    case Ha = "は"
    case Hi = "ひ"
    case Hu = "ふ"
    case He = "へ"
    case Ho = "ほ"
    case Ma = "ま"
    case Mi = "み"
    case Mu = "む"
    case Me = "め"
    case Mo = "も"
    case Ya = "や"
    case Yu = "ゆ"
    case Yo = "よ"
    case Ra = "ら"
    case Ri = "り"
    case Ru = "る"
    case Re = "れ"
    case Ro = "ろ"
    case Wa = "わ"
    case Wo = "を"
    case Nn = "ん"
    case Xtu = "っ"
    case Xya = "ゃ"
    case Xyu = "ゅ"
    case Xyo = "ょ"
    case Daku = "゛"
    case Handaku = "゜"
    case Hyphen = "−"
    case Space = "　"

    public func index() -> Int {
        return NameChar.indexOf(self)
    }

    public static func indexOf(_ entity: NameChar) -> Int {
        return [
            Num0, Num1, Num2, Num3, Num4,
            Num5, Num6, Num7, Num8, Num9,
            A, I, U, E, O,
            Ka, Ki, Ku, Ke, Ko,
            Sa, Si, Su, Se, So,
            Ta, Ti, Tu, Te, To,
            Na, Ni, Nu, Ne, No,
            Ha, Hi, Hu, He, Ho,
            Ma, Mi, Mu, Me, Mo,
            Ya, Yu, Yo,
            Ra, Ri, Ru, Re, Ro,
            Wa, Wo, Nn,
            Xtu, Xya, Xyu, Xyo,
            Daku, Handaku, Hyphen, Space
        ].index(of: entity)!
    }
}

public enum Item: String {
    case Nothing = "なし"
    case Torch = "たいまつ"
    case FairyWater = "せいすい"
    case Wings = "キメラのつばさ"
    case DragonScale = "りゅうのうろこ"
    case FairyFlute = "ようせいのふえ"
    case FightersRing = "せんしのゆびわ"
    case LotosToken = "ロトのしるし"
    case LorasLove = "おうじょのあい"
    case CursedBelt = "のろいのベルト"
    case SilverHarp = "ぎんのたてごと"
    case CursedNecklace = "しのくびかざり"
    case StonesOfSunlight = "たいようのいし"
    case StaffOfRain = "あまぐものつえ"
    case BallOfLight = "にじのしずく"
    case Unknown = "不明"
    
    public func index() -> Int {
        return Item.indexOf(self)
    }

    public static func indexOf(_ item: Item) -> Int {
        return [
            Nothing, Torch, FairyWater, Wings,
            DragonScale, FairyFlute, FightersRing, LotosToken,
            LorasLove, CursedBelt, SilverHarp, CursedNecklace,
            StonesOfSunlight, StaffOfRain, BallOfLight, Unknown
        ].index(of: item)!
    }
}

public enum Weapon: String {
    case Nothing = "なし"
    case BambooPole = "たけざお"
    case Club = "こんぼう"
    case CopperSword = "どうのつるぎ"
    case HandAxe = "てつのおの"
    case BroadSword = "はがねのつるぎ"
    case FlameSword = "ほのおのつるぎ"
    case LotoSword = "ロトのつるぎ"

    public func index() -> Int {
        return Weapon.indexOf(self)
    }

    public static func indexOf(_ weapon: Weapon) -> Int {
        return [
            Nothing, BambooPole, Club, CopperSword,
            HandAxe, BroadSword, FlameSword, LotoSword
        ].index(of: weapon)!
    }
}

public enum Armor: String {
    case Nothing = "なし"
    case Clothes = "ぬののふく"
    case LeatherArmor = "かわのふく"
    case ChainMail = "くさりかたびら"
    case HalfPlate = "てつのよろい"
    case FullPlate = "はがねのよろい"
    case MagicArmor = "まほうのよろい"
    case LotoArmor = "ロトのよろい"
    
    public func index() -> Int {
        return Armor.indexOf(self)
    }

    public static func indexOf(_ armor: Armor) -> Int {
        return [
            Nothing, Clothes, LeatherArmor, ChainMail,
            HalfPlate, FullPlate, MagicArmor, LotoArmor
        ].index(of: armor)!
    }
}

public enum Shield: String {
    case Nothing = "なし"
    case SmallShield = "かわのたて"
    case LargeShield = "てつのたて"
    case SilverShield = "みかがみのたて"
    
    public func index() -> Int {
        return Shield.indexOf(self)
    }

    public static func indexOf(_ shield: Shield) -> Int {
        return [
            Nothing, SmallShield, LargeShield, SilverShield
        ].index(of: shield)!
    }
}
