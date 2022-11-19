//
//  TCRegisterAlertVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 19/11/22.
//

import UIKit
import SnapKit

class TCRegisterAlertVC: UIViewController {
    
    // MARK: - Properties
    internal lazy var visualEffectView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: .none)
        view.effect = UIBlurEffect(style: .systemUltraThinMaterial)
        return view
    }()
    
    internal lazy var headingLabel: GLabel = {
        let label = GLabel(style: .heading1, textString: "Dengan ini, saya menyatakan bahwa saya:")
        return label
    }()
    
    internal lazy var contentLabel1: GLabel = {
        let label = GLabel(style: .bodyText, textString: "")
        label.attributedText = UIFont().addBullet(string: "Telah membaca semua informasi protokol new normal")
        return label
    }()
    
    internal lazy var contentLabel2: GLabel = {
        let label = GLabel(style: .bodyText, textString: "")
        label.attributedText = UIFont().addBullet(string: "Mengisi data registrasi ini dengan sesuai dan sebenar-benarnya")
        return label
    }()
    
    internal lazy var contentLabel3: GLabel = {
        let label = GLabel(style: .bodyText, textString: "")
        label.attributedText = UIFont().addBullet(string: "Memutuskan untuk hadir di ibadah onsite dengan pertimbangan yang matang dan tanpa ada paksaan")
        return label
    }()
    
    internal lazy var contentLabel4: GLabel = {
        let label = GLabel(style: .bodyText, textString: "")
        label.attributedText = UIFont().addBullet(string: "Bersedia untuk mengikuti semua protokol kesehatan yang berlaku")
        return label
    }()
    
    internal lazy var contentLabel5: GLabel = {
        let label = GLabel(style: .bodyText, textString: "")
        label.attributedText = UIFont().addBullet(string: "Telah melaksanakan vaksinasi COVID-19 sebanyak 2 (dua) kali")
        return label
    }()
    
    internal lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .contentBG
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    
    internal lazy var cancelButton: GButton = {
        let button = GButton(style: .secondary, buttonText: "Batal", selector: #selector(handleCancelButton), target: self)
        return button
    }()
    
    internal lazy var registerButton: GButton = {
        let button = GButton(style: .primary, buttonText: "Daftar", selector: #selector(handleRegisterButton), target: self)
        return button
    }()
    
    internal lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cancelButton, registerButton])
        stack.axis = .horizontal
        stack.spacing = 6
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    internal lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [headingLabel, contentLabel1, contentLabel2, contentLabel3, contentLabel4, contentLabel5, divider, buttonStack])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 15
        stack.backgroundColor = .contentBG
        stack.layoutMargins = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.addDressing(useShadow: false, useCornerRadius: true, useBorder: false)
        return stack
    }()
    
    var delegate: FinalCheckVCDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleCancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc func handleRegisterButton() {
        self.dismiss(animated: true) {
            self.delegate?.navigateToOutput()
        }
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .clear
        
        view.addSubview(visualEffectView)
        visualEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.center.equalToSuperview()
        }
    }
}
