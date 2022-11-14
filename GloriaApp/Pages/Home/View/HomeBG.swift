//
//  HomeBG.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 14/11/22.
//

import UIKit

class HomeBG: UIImageView {
    
    init() {
        
        super.init(frame: .zero)
        self.image = UIImage(named: "HomeBG")
        self.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
