//
//  DataDiriPengunjungTableViewCell.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit
import SnapKit

class DataDiriPengunjungTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "DataDiriPengunjungTableViewCell"
    
    let nameTF = DataDiriStack(title: "Nama", tfContent: "Esgeee")
    let dobTF = DataDiriStack(title: "Tanggal Lahir", tfContent: "13 Maret 2001")
    let emailTF = DataDiriStack(title: "Alamat Email", tfContent: "e@gmail.com")
    let addressTF = DataDiriStack(title: "Alamat Rumah", tfContent: "Gilpin 23, Arcadia Village")
    let phoneTF = DataDiriStack(title: "Nomor Telepon", tfContent: "081299299838")
    
    // MARK: - Helpers
    func configureUI() {
        
        contentView.backgroundColor = .clear
        
        let stack = UIStackView(arrangedSubviews: [nameTF, dobTF, emailTF, addressTF, phoneTF])
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fill
        
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom).offset(-28)
        }
    }
}

class DataDiriStack: UIView {
    
    var title: String
    var tfContent: String
    
    //MARK: - Lifecycle
    required init(title: String, tfContent: String) {
        
        self.title = title
        self.tfContent = tfContent
        super.init(frame: .zero)
        
        backgroundColor = .clear
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configureUI() {
        
        self.backgroundColor = .clear
        
        let titleLabel = GLabel(style: .buttonText, textString: title)
        let tf = GTextField(style: .disabled, placeholderText: "")
        tf.text = tfContent
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        self.addSubview(tf)
        tf.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
