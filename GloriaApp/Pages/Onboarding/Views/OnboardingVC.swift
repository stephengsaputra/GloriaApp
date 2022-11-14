//
//  OnboardingVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 12/11/22.
//

import UIKit
import SnapKit

class OnboardingVC: UIViewController {
    
    // MARK: - Properties
    internal lazy var gkaIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gka_icon")
        image.backgroundColor = .primaryColor
        image.layer.cornerRadius = 40
        return image
    }()
    
    internal lazy var headingLabel: GLabel = {
        let label = GLabel(style: .largeTitle2, textString: "Selamat datang!")
        return label
    }()
    
    internal lazy var subheadingLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "Akses informasi terbaru tentang gereja dan tumbuh semakin dekat kepada Tuhan")
        label.textAlignment = .center
        return label
    }()
    
    internal lazy var button: GButton = {
        let button = GButton(style: .primary, buttonText: "Mulai", selector: #selector(handleButton), target: self)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleButton() {
        navigationController?.pushViewController(HomeVC(), animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(gkaIcon)
        gkaIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(view.frame.height / 4.176)
        }
        
        let stack = UIStackView(arrangedSubviews: [headingLabel, subheadingLabel])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 6
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gkaIcon.snp.bottom).offset(view.frame.height / 11.671)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
}

