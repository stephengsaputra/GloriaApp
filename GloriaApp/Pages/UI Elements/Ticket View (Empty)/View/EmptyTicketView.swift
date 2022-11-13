//
//  EmptyTicketView.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 13/11/22.
//

import UIKit

class EmptyTicketView: UIView {

    // MARK: - Properties
    private lazy var headingLabel: GLabel = {
        let label = GLabel(style: .heading2, textString: "Tidak ada acara selanjutnya")
        return label
    }()
    
    private lazy var verseLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "Waduh! Kelihatannya kamu tidak mendaftar ke acara apapun")
        label.textAlignment = .center
        label.textColor = .secondaryTextColor
        return label
    }()
    
    private lazy var verseNameLabel: GLabel = {
        let label = GLabel(style: .caption3, textString: "")
        label.textAlignment = .center
        label.textColor = .secondaryButtonColor
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "Ketuk untuk mendaftar ke sebuah acara")
        attributeString.addAttribute(.underlineStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        
        label.attributedText = attributeString
        
        return label
    }()
    
    //MARK: - Lifecycle
    required init() {
        
        super.init(frame: .zero)
        
        backgroundColor = .secondaryColor
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors
    
    
    // MARK: - Helpers
    private func configureUI() {
        
        self.backgroundColor = .secondaryColor
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: false)
        
        let stack = UIStackView(arrangedSubviews: [headingLabel, verseLabel, verseNameLabel])
        stack.spacing = 20
        stack.alignment = .center
        stack.axis = .vertical
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(30)
            make.leading.trailing.equalToSuperview().inset(40)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
        }
    }
    
    private func updateColors() {
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: false)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
        self.setNeedsDisplay()
    }
}
