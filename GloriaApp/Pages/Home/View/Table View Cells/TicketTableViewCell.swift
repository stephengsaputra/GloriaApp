//
//  TicketTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 14/11/22.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    static let identifier = "TicketTableViewCell"
    
    // MARK: - Properties
    internal lazy var upcomingEventLabel: GLabel = {
        let label = GLabel(style: .heading1, textString: "Upcoming Event")
        return label
    }()
    
    let ticketView = EmptyTicketView()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        let stack = UIStackView(arrangedSubviews: [upcomingEventLabel, ticketView])
        stack.alignment = .leading
        stack.spacing = 6
        stack.axis = .vertical
        
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom).offset(-28)
        }
    }
}
