import Foundation
import SwiftyHolidays

extension Country {
    var englishDisplayString: String {
        return displayString(locale: Locale(identifier: "en_US"))
    }
    
    var inString: String {
        return (self == .unitedStates ? "the " : "") + englishDisplayString
    }
    
    var displayStringWithFlag: String {
        return emojiFlag + " " + englishDisplayString
    }
    
    private var emojiFlag: String {
        return iso2Code.uppercased().unicodeScalars.reduce("") { acc, us in
            return acc + String(UnicodeScalar(127397 + us.value)!)
        }
    }
}
