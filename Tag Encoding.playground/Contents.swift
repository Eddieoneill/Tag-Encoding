
//import Foundation
//
//func randomString(length: Int) -> String {
//
//    let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//    let len = UInt32(letters.length)
//
//    var randomString = ""
//
//    for _ in 0..<length {
//        let rand = arc4random_uniform(len)
//        var nextChar = letters.character(at: Int(rand))
//        randomString += NSString(characters: &nextChar, length: 1) as String
//    }
//
//    return randomString
//}
//
//randomString(length: 6)
//
//func test(_ array: [String] = [], _ num: Int) -> [String] {
//    var numbers = array
//    let count = num - array.count
//    for _ in 1...count {
//        let randomNumber = randomString(length: 6)
//        if numbers.contains(randomNumber) {
//            var newNumber = randomString(length: 6)
//            while numbers.contains(newNumber) {
//                newNumber = randomString(length: 6)
//            }
//            numbers.append(newNumber)
//        } else {
//            numbers.append(randomNumber)
//        }
//    }
//    return numbers
//}
//
//print(test(["TDYNND", "OCCFLW"], 100))









enum StickerCode: String {
    case mophie = "mp_r"
    case headphone = "hp_r"
}

enum TagCode: String {
    case bag = "bg"
    case coat = "ct"
    case universal = "uni"
}


enum Color: String {
    // These colors are represented in hexidecimal notation
    case blue = "166b8f"
    case gold = "f4b027"
    case green = "68a21d"
    case grey = "59595b"
    case orange = "e56000"
    case white = "ffffff"
    case purple = "764168"
    case black = "000000"
    case red = "ea1754"
}

struct ItemCode {
    let value: String

    init(version: Int = 2, stickerCode: StickerCode, tagNumber: Int, tagColor: Color, tagGroup: Int) {
        // This is an item code which is looks like the following: 2.hp_r.166b8f.94.1,2,hp_r,"166b8f",94,1
        self.value = "\(version).\(stickerCode.rawValue).\(tagColor.rawValue).\(tagNumber).\(tagGroup),\(version),\(stickerCode.rawValue),\"\(tagColor.rawValue)\",\(tagNumber),\(tagGroup)"
    }

    init(version: Int = 2, tagCode: TagCode, tagNumber: Int, tagColor: Color, tagGroup: Int) {
        // This is an item code which is looks like the following: 2.hp_r.166b8f.94.1,2,hp_r,"166b8f",94,1
        self.value = "\(version).\(tagCode.rawValue).\(tagColor.rawValue).\(tagNumber).\(tagGroup),\(version),\(tagCode.rawValue),\"\(tagColor.rawValue)\",\(tagNumber),\(tagGroup)"
    }
}

class ItemCodeManager {
    func buildItemCodes(startingAt: Int, endingAt: Int, tagGroup: Int = 1) -> [ItemCode] {
        var itemCodes: [ItemCode] = []
        for number in startingAt...endingAt {
// Below will be the tag type and tag color selection
            let currentCode = ItemCode(stickerCode: StickerCode.headphone, tagNumber: number, tagColor: Color.black, tagGroup: tagGroup);            itemCodes.append(currentCode)
        }
        return itemCodes
    }
}


func getItemCode(startingAt: Int, endingAt: Int) -> [ItemCode] {
    let itemCodeManager = ItemCodeManager()

    var arrays = [[ItemCode]]()
    for num in startingAt...endingAt {
// Below will be the range of the tags
        arrays.append(itemCodeManager.buildItemCodes(startingAt: 10000000001, endingAt: 10000000100, tagGroup: num))
    }

    let newArray = arrays.flatMap { $0 }
    return newArray
}
// Below is going to be the inventory number and th about of set of tags you want to make
let codes = getItemCode(startingAt: 1, endingAt: 50)
codes.forEach { print($0.value) }


