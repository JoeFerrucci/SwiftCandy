import UIKit
import Foundation

public typealias TextStyle = NSMutableAttributedString -> NSMutableAttributedString

infix operator >>> { associativity left }

public func >>> (style1: TextStyle, style2: TextStyle) -> TextStyle {
    return { string in
        style2(style1(string))
    }
}

public class TextStyles {
    static public func textBackground(color: UIColor, range: NSRange? = nil) -> TextStyle {
        return { mutableAttributedString in
            let newString = NSMutableAttributedString(attributedString: mutableAttributedString)
            if let r = range {
                newString.addAttribute(NSBackgroundColorAttributeName, value: color, range: r)
            } else {
                let r = NSRange(location: 0, length: mutableAttributedString.string.characters.count)
                newString.addAttribute(NSBackgroundColorAttributeName, value: color, range: r)
            }
            return newString
        }
    }
    
    static public func textColor(color: UIColor) -> TextStyle {
        return { mutableAttributedString in
            let newString = NSMutableAttributedString(attributedString: mutableAttributedString)
            let range = NSRange(location: 0, length: mutableAttributedString.string.characters.count)
            newString.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
            return newString
        }
    }
}


public extension String {
    var mutableAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
    var attributedString: NSAttributedString  {
        return NSAttributedString(string: self)
    }
}