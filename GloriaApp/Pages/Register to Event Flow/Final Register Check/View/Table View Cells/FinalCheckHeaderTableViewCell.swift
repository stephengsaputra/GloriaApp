//
//  FinalCheckHeaderTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit

class FinalCheckHeaderTableViewCell: UITableViewCell {

    static let identifier = "FinalCheckHeaderTableViewCell"
    
    // MARK: - Properties
    internal lazy var label: GLabel = {
        let label = GLabel(style: .heading1, textString: "Terakhir, cek kembali apakah sudah benar")
        label.textAlignment = .left
        label.textColor = .textColor
        return label
    }()
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-28)
        }
    }
}
