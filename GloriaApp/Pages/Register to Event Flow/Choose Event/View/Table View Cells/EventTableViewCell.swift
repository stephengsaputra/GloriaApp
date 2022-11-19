//
//  EventTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import UIKit
import SnapKit

class EventTableViewCell: UITableViewCell {

    static let identifier = "EventTableViewCell"
    
    // MARK: - Properties
    var data: [Event] = []
    
    weak var selectedView: ReusableEventView? { willSet {
        
            UIView.animate(withDuration: 0.2) {
                // set unselected state
                self.selectedView?.backgroundColor = UIColor.contentBG
                self.selectedView?.layer.borderColor = UIColor.contentBorder?.cgColor
                
                // set new view to selected state
                newValue?.backgroundColor = .secondaryColor
                newValue?.layer.borderColor = UIColor.primaryColor?.cgColor
            }
        }
    }
    
    internal lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 6
        stack.axis = .vertical
        return stack
    }()
    
    var delegate: ChooseEventDelegate?
    
    // MARK: - Selectors
    @objc func onViewSelected(_ sender: UITapGestureRecognizer) {
        selectedView = sender.view as? ReusableEventView
        delegate?.showButton(
            eventName: selectedView?.eventName ?? "",
            eventType: selectedView?.eventType ?? "",
            eventLocation: selectedView?.eventLocation ?? "",
            eventDateTime: selectedView?.eventDateTime ?? Date()
        )
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top).offset(0)
            make.bottom.equalTo(contentView.snp.bottom).offset(StaticVariables.bottomPadding() - 65)
        }
        
        configureTicketButton()
    }
    
    func configureTicketButton() {

        let views = generateTicket()

        views.forEach {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onViewSelected(_:)))
            $0.addGestureRecognizer(tapGesture)
            
            stack.addArrangedSubview($0)
        }
    }
    
    func generateTicket() -> [ReusableEventView] {
        
        var views: [ReusableEventView] = []
        
        for i in 0..<data.count {
            
            let event = ReusableEventView(eventName: data[i].eventName, eventType: data[i].eventType, eventLocation: data[i].eventLocation, eventDateTime: data[i].eventDateTime)
            views.append(event)
        }
        
        return views
    }
}
