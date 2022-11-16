//
//  ReusableEventView.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import UIKit
import SnapKit

class ReusableEventView: UIControl {

    // MARK: - Properties
    internal lazy var eventNameLabel: GLabel = {
        let label = GLabel(style: .heading2, textString: "Kebaktian Umum 2")
        return label
    }()
    
    internal lazy var eventTypeLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "Umum")
        return label
    }()
    
    internal lazy var eventLocationLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "GKA Gloria Pacar")
        label.textColor = .secondaryTextColor
        return label
    }()
    
    internal lazy var eventDateLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "Minggu, 2 Januari 2022")
        label.textColor = .secondaryTextColor
        return label
    }()
    
    internal lazy var eventTimeLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "09.00")
        label.textColor = .secondaryTextColor
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
        
        self.backgroundColor = .contentBG
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: true)
        
        let eventLabelStack = UIStackView(arrangedSubviews: [eventNameLabel, eventTypeLabel])
        eventLabelStack.alignment = .leading
        eventLabelStack.axis = .vertical
        eventLabelStack.spacing = 5
        
        let eventDetailStack = UIStackView(arrangedSubviews: [eventLocationLabel, eventDateLabel, eventTimeLabel])
        eventDetailStack.alignment = .leading
        eventDetailStack.axis = .vertical
        eventDetailStack.spacing = 0
        
        let stack = UIStackView(arrangedSubviews: [eventLabelStack, eventDetailStack])
        stack.spacing = 20
        stack.alignment = .leading
        stack.axis = .vertical
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
    }
    
    private func updateColors() {
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: true)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
        self.setNeedsDisplay()
    }
}
