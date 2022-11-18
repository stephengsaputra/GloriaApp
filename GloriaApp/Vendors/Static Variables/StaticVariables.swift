//
//  StaticVariables.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import Foundation
import UIKit

struct StaticVariables {
    
    static func bottomPadding() -> Int {
        
        let notch: CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        return notch > 20 ? -10 : -20
    }
}
