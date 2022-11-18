//
//  HomeButtonTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 14/11/22.
//

import UIKit
import SnapKit

class HomeButtonTableViewCell: UITableViewCell {

    static let identifier = "HomeButtonTableViewCell"
    
    // MARK: - Properties
    let button1 = ReusableHomePageButton(type: .cutToCut, selector: #selector(handleButton), target: self)
    let button2 = ReusableHomePageButton(type: .churchEvents, selector: #selector(handleButton), target: self)
    let button3 = ReusableHomePageButton(type: .lectioDivina, selector: #selector(handleButton), target: self)
    
    // MARK: - Selectors
    @objc func handleButton() {
        print("DEBUG: Hello, world!")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        let stack = UIStackView(arrangedSubviews: [button1, button2, button3])
        stack.axis = .vertical
        stack.spacing = 6
        
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom).offset(StaticVariables.bottomPadding())
        }
    }
}
