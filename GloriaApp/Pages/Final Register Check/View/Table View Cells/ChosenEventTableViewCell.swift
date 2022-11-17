//
//  ChosenEventTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit
import SnapKit

class ChosenEventTableViewCell: UITableViewCell {

    static let identifier = "ChosenEventTableViewCell"
    
    var eventName: String = ""
    var eventType: String = ""
    var eventLocation: String = ""
    var eventDateTime: Date = Date()
    
    // MARK: - Properties
    internal lazy var headingLabel: GLabel = {
        let label = GLabel(style: .heading1, textString: "Ibadah yang ingin diikuti")
        return label
    }()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(headingLabel)
        headingLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top)
        }
        
        let ticketView = ReusableEventView(eventName: eventName, eventType: eventType, eventLocation: eventLocation, eventDateTime: eventDateTime)
        contentView.addSubview(ticketView)
        ticketView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(headingLabel.snp.bottom).offset(6 )
            make.bottom.equalTo(contentView.snp.bottom).offset(-28)
        }
    }
}
