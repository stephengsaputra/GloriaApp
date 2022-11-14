//
//  HeaderTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    static let identifier = "HeaderTableViewCell"
    
    // MARK: - Properties
    internal lazy var label: GLabel = {
        let label = GLabel(style: .heading1, textString: "Pertama, pilih ibadah apa yang Anda ingin ikuti")
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
            make.top.equalTo(contentView.snp.top).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
        }
    }
}
