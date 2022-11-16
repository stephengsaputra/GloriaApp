//
//  GTextField.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit
import SnapKit

class GTextField: UITextField {
    
    enum Style {
        case enabled
        case disabled
    }
    
    //MARK: - Initializers
    public private(set) var style: Style
    public private(set) var placeholderText: String
    
    init(style: Style, placeholderText: String) {
        
        self.style = style
        self.placeholderText = placeholderText
        super.init(frame: .zero)
        
        configureTF()
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func configureTF() {
        
        configureTFStyle()
    }
    
    private func configureTFStyle() {
        
        switch style {
        case .enabled:
            self.backgroundColor = UIColor.tfBG
            self.layer.borderColor = UIColor.tfBorder?.cgColor
            self.layer.borderWidth = 1.5
        case .disabled:
            self.backgroundColor = UIColor.systemGray6
            self.isEnabled = false
        }
        
        self.borderStyle = .none
        self.layer.cornerRadius = 12
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always

        self.textColor = .textColor
        self.font = UIFont.bodyText()
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                .font: UIFont.bodyText()
            ]
        )
        
        self.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
    
    private func updateColors() {
        self.layer.borderColor = UIColor.tfBorder?.cgColor
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
        self.setNeedsDisplay()
    }
}

extension GTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
