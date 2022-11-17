//
//  TicketTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 14/11/22.
//

import UIKit
import SnapKit

class EmptyTicketTableViewCell: UITableViewCell {

    static let identifier = "EmptyTicketTableViewCell"
    
    // MARK: - Properties
    internal lazy var upcomingEventLabel: GLabel = {
        let label = GLabel(style: .heading1, textString: "Upcoming Event")
        return label
    }()
    
    let ticketView = EmptyTicketView()
    var delegate: HomeVCDelegate?
    
    // MARK: - Selectors
    @objc func onViewSelected(_ sender: UITapGestureRecognizer) {
        self.delegate?.navigateToChooseEvent()
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(upcomingEventLabel)
        upcomingEventLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top)
        }
        
        contentView.addSubview(ticketView)
        ticketView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(upcomingEventLabel.snp.bottom).offset(6)
            make.bottom.equalTo(contentView.snp.bottom).offset(-28)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onViewSelected(_:)))
        ticketView.addGestureRecognizer(tapGesture)
    }
}
