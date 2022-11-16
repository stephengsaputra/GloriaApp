//
//  EmptyTicketView.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 13/11/22.
//

import UIKit
import SnapKit

class EmptyTicketView: UIView {

    // MARK: - Properties
    internal lazy var emptyHeadingLabel: GLabel = {
        let label = GLabel(style: .heading2, textString: "Tidak ada acara selanjutnya")
        return label
    }()
    
    internal lazy var emptyBodyLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "Waduh! Kelihatannya kamu tidak mendaftar ke acara apapun")
        label.textAlignment = .center
        label.textColor = .secondaryTextColor
        return label
    }()
    
    internal lazy var emptyCTAButton: UILabel = {
        let label = UILabel()
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "Ketuk untuk mendaftar ke sebuah acara")
        attributeString.addAttribute(.underlineStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(.font, value: UIFont.caption2(), range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(.foregroundColor, value: UIColor.secondaryButtonColor ?? UIColor.label, range: NSMakeRange(0, attributeString.length))
        
        label.attributedText = attributeString
        
        return label
    }()
    
    var delegate: EmptyTicketCellDelegate?
    
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
    @objc func onViewSelected(_ sender: UITapGestureRecognizer) {
        self.delegate?.triggerNavigation()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        
        self.backgroundColor = .secondaryColor
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: false)
        
        let stack = UIStackView(arrangedSubviews: [emptyHeadingLabel, emptyBodyLabel, emptyCTAButton])
        stack.spacing = 20
        stack.alignment = .center
        stack.axis = .vertical
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onViewSelected(_:)))
        self.addGestureRecognizer(tapGesture)
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
