//
//  ReusableEventView.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import UIKit
import SnapKit

class ReusableEventView: UIView {

    // MARK: - Properties
    var eventName: String
    var eventType: String
    var eventLocation: String
    var eventDateTime: Date
    
    //MARK: - Lifecycle
    required init(eventName: String, eventType: String, eventLocation: String, eventDateTime: Date) {
        
        self.eventName = eventName
        self.eventType = eventType
        self.eventLocation = eventLocation
        self.eventDateTime = eventDateTime
        
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
        
        let eventNameLabel = GLabel(style: .heading2, textString: eventName)
        let eventTypeLabel = GLabel(style: .bodyText, textString: eventType)
        
        let eventLabelStack = UIStackView(arrangedSubviews: [eventNameLabel, eventTypeLabel])
        eventLabelStack.alignment = .leading
        eventLabelStack.axis = .vertical
        eventLabelStack.spacing = 5
        
        let eventLocationLabel = GLabel(style: .bodyText, textString: eventLocation)
        eventLocationLabel.textColor = .secondaryTextColor
        let eventDateLabel = GLabel(style: .bodyText, textString: Event.dateFormatter(date: eventDateTime))
        eventDateLabel.textColor = .secondaryTextColor
        let eventTimeLabel = GLabel(style: .bodyText, textString: Event.timeFormatter(date: eventDateTime))
        eventTimeLabel.textColor = .secondaryTextColor
        
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
