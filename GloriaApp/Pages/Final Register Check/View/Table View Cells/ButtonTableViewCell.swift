//
//  ButtonTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit
import SnapKit

class ButtonTableViewCell: UITableViewCell {
    
    static let identifier = "ButtonTableViewCell"
    
    // MARK: - Properties
    internal lazy var button: GButton = {
        let button = GButton(style: .primary, buttonText: "Daftar", selector: #selector(handleButton), target: self)
        return button
    }()
    
    // MARK: - Selectors
    @objc func handleButton() {
        print("DEBUG: Hello, world!")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top).offset(28)
            make.bottom.equalTo(contentView.snp.bottom).offset(StaticVariables.bottomPadding())
        }
    }
}
