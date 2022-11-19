//
//  UIFontExtensions.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 12/11/22.
//

import UIKit

extension UIFont {
    
    static func largeTitle1() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-Bold", size: 32) else {
            return UIFont.systemFont(ofSize: 28)
        }
        
        return customFont
    }
    
    static func largeTitle2() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-Bold", size: 28) else {
            return UIFont.systemFont(ofSize: 28)
        }
        
        return customFont
    }
    
    static func heading1() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-SemiBold", size: 20) else {
            return UIFont.systemFont(ofSize: 20)
        }
        
        return customFont
    }
    
    static func heading2() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-SemiBold", size: 17) else {
            return UIFont.systemFont(ofSize: 17)
        }
        
        return customFont
    }
    
    static func heading3() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-SemiBold", size: 15) else {
            return UIFont.systemFont(ofSize: 15)
        }
        
        return customFont
    }
    
    static func caption1() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-Medium", size: 16) else {
            return UIFont.systemFont(ofSize: 16)
        }
        
        return customFont
    }
    
    static func caption2() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-Medium", size: 14) else {
            return UIFont.systemFont(ofSize: 14)
        }
        
        return customFont
    }
    
    static func buttonText() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-Medium", size: 15) else {
            return UIFont.systemFont(ofSize: 15)
        }
        
        return customFont
    }
    
    static func bodyText() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-Regular", size: 16) else {
            return UIFont.systemFont(ofSize: 15)
        }
        
        return customFont
    }
    
    static func subtitleText() -> UIFont {
        
        guard let customFont = UIFont(name: "Poppins-Regular", size: 12) else {
            return UIFont.systemFont(ofSize: 12)
        }
        
        return customFont
    }
    
    func addBullet(string: String, bullet: String = "\u{2022}", indentation: CGFloat = 15) -> NSAttributedString {
        
        let textAttributes = [
            NSAttributedString.Key.font: UIFont.bodyText(),
            NSAttributedString.Key.foregroundColor: UIColor.textColor
        ]
        let bulletAttributes = [
            NSAttributedString.Key.font: UIFont.bodyText(),
            NSAttributedString.Key.foregroundColor: UIColor.textColor
        ]
        
        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.headIndent = indentation
        
        let bulletList = NSMutableAttributedString()
        let formattedString = "\(bullet)\t\(string)"
        let attributedString = NSMutableAttributedString(string: formattedString)
        
        attributedString.addAttributes(
            [NSAttributedString.Key.paragraphStyle : paragraphStyle],
            range: NSMakeRange(0, attributedString.length))
        
        attributedString.addAttributes(
            textAttributes as [NSAttributedString.Key : Any],
            range: NSMakeRange(0, attributedString.length))
        
        let string = NSString(string: formattedString)
        let rangeForBullet = string.range(of: bullet)
        
        attributedString.addAttributes(bulletAttributes as [NSAttributedString.Key : Any], range: rangeForBullet)
        bulletList.append(attributedString)
        
        return bulletList
    }
}
