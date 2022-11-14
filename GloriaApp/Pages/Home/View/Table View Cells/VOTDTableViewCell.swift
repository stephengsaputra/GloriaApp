//
//  VOTDTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 14/11/22.
//

import UIKit
import SnapKit

class VOTDTableViewCell: UITableViewCell {

    static let identifier = "VOTDTableViewCell"
    
    // MARK: - Properties
    let votd = VerseOfTheDayView()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(votd)
        votd.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom).offset(-28)
        }
    }
}
