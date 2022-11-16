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
    let eventView1 = ReusableEventView()
    let eventView2 = ReusableEventView()
    let eventView3 = ReusableEventView()
    let eventView4 = ReusableEventView()
    let eventView5 = ReusableEventView()
    let eventView6 = ReusableEventView()
    let eventView7 = ReusableEventView()
    let eventView8 = ReusableEventView()
    let eventView9 = ReusableEventView()
    let eventView10 = ReusableEventView()
    
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
    
    var delegate: ChooseEventDelegate?
    
    // MARK: - Selectors
    @objc func onViewSelected(_ sender: UITapGestureRecognizer) {
        selectedView = sender.view as? ReusableEventView
        delegate?.showButton()
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        let stack = UIStackView(arrangedSubviews: [eventView1, eventView2, eventView3, eventView4, eventView5, eventView6, eventView7, eventView8, eventView9, eventView10])
        stack.spacing = 6
        stack.axis = .vertical
        
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top).offset(0)
            make.bottom.equalTo(contentView.snp.bottom).offset(StaticVariables.bottomPadding() - 65)
        }
        
        configureTicketButton()
    }
    
    func configureTicketButton() {
        
        let views = [eventView1, eventView2, eventView3, eventView4, eventView5, eventView6, eventView7, eventView8, eventView9, eventView10]
        
        views.forEach {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onViewSelected(_:)))
            $0.addGestureRecognizer(tapGesture)
        }
    }
}
