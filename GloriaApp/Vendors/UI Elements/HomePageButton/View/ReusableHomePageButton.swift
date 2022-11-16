//
//  ReusableHomePageButton.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 13/11/22.
//

import UIKit
import SnapKit

class ReusableHomePageButton: UIButton {
    
    enum Style {
        case cutToCut
        case churchEvents
        case lectioDivina
    }
    
    public private(set) var type: Style
    public private(set) var selector: Selector
    public private(set) var target: Any
    
    init(type: Style, selector: Selector, target: Any) {
        
        self.type = type
        self.selector = selector
        self.target = target
        
        super.init(frame: .zero)
        configureTarget()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTarget(){
        self.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    private func configureButton() {
        
        switch type {
            case .cutToCut:
                self.setBackgroundImage(UIImage(named: "cutToCut"), for: .normal)
                self.setTitle("Cut To Cut Ibadah Series", for: .normal)
            case .churchEvents:
                self.setBackgroundImage(UIImage(named: "churchEvents"), for: .normal)
                self.setTitle("Church Events", for: .normal)
            case .lectioDivina:
                self.setBackgroundImage(UIImage(named: "lectioDivina"), for: .normal)
                self.setTitle("Lectio Divina", for: .normal)
        }
        
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: false)
        self.clipsToBounds = true
        
        self.adjustsImageWhenHighlighted = false
        
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.caption1()
        
        self.snp.makeConstraints { make in
            make.height.equalTo(90)
        }
    }
    
    //MARK: Animate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: [.allowUserInteraction, .curveEaseInOut]) {
                self.transform = .init(scaleX: 0.99, y: 0.99)
                self.alpha = 0.9
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesEnded(touches, with: event)
        
        UIView.animate(
            withDuration: 0.05,
            delay: 0,
            options: [.allowUserInteraction, .curveEaseOut]) {
                self.transform = .identity
                self.alpha = 1
            }
    }
    
    private func updateColors() {
        self.addDressing(useShadow: true, useCornerRadius: false, useBorder: false)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
        self.setNeedsDisplay()
    }
}
