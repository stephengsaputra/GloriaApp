//
//  GButton.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 12/11/22.
//

import UIKit
import SnapKit

class GButton: UIButton {

    //MARK: Initializers
    enum Style {
        case primary
        case secondary
        case primaryDisabled
        case destructive
    }
    
    public private(set) var style: Style
    public private(set) var buttontext: String
    public private(set) var selector: Selector
    public private(set) var target: Any
    
    init(style: Style, buttonText: String, selector: Selector, target: Any) {
        
        self.style = style
        self.buttontext = buttonText
        self.selector = selector
        self.target = target
        
        super.init(frame: .zero)
        configureButton()
        configureTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func configureTarget(){
        self.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    private func configureButton() {
        
        self.setTitle(buttontext, for: .normal)
        
        switch style {
            case .primary:
                self.backgroundColor = UIColor.primaryButtonColor
                self.tintColor = UIColor.white
            case .secondary:
                self.backgroundColor = .clear
                self.layer.borderColor = UIColor.secondaryButtonColor?.cgColor
                self.layer.borderWidth = 2
                self.setTitleColor(.secondaryButtonColor, for: .normal)
            case .destructive:
                self.backgroundColor = UIColor.destructiveButtonColor
                self.tintColor = UIColor.white
            case .primaryDisabled:
                self.backgroundColor = UIColor.primaryDisabledButton
                self.tintColor = UIColor.primaryDisabledText
                self.isEnabled = false
        }
        
        self.layer.cornerRadius = 12
        self.titleLabel?.font = UIFont.buttonText()
        self.setTitle(buttontext, for: .normal)
        self.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
        }
    }
    
    public func makeDisabled(isDisabled: Bool) {

        self.isEnabled = !isDisabled
        self.backgroundColor = isDisabled ? .primaryDisabledButton : .primaryButtonColor
        self.setTitleColor(isDisabled ? .primaryDisabledText : .white, for: .normal)
    }
    
    //MARK: Animate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: [.allowUserInteraction, .curveEaseInOut]) {
                self.transform = .init(scaleX: 0.99, y: 0.99)
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesEnded(touches, with: event)
        
        UIView.animate(
            withDuration: 0.05,
            delay: 0,
            options: [.allowUserInteraction, .curveEaseOut]) {
                self.transform = .identity
            }
    }
    
    private func updateColors() {
        self.layer.borderColor = UIColor.secondaryButtonColor?.cgColor
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
        self.setNeedsDisplay()
    }
}
