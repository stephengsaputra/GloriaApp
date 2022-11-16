//
//  DataDiriPengunjungTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit
import SnapKit

class DataDiriPengunjungTableViewCell: UITableViewCell {

    static let identifier = "DataDiriPengunjungTableViewCell"
    
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
    }
}
