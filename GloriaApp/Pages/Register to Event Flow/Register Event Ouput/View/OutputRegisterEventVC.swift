//
//  OutputRegisterEventVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 19/11/22.
//

import UIKit
import SnapKit

class OutputRegisterEventVC: UIViewController {

    // MARK: - Properties
    internal lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Register_Event_Output")
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        return image
    }()
    
    internal lazy var headingLabel: GLabel = {
        let label = GLabel(style: .heading1, textString: "Pendaftaran Berhasil")
        return label
    }()
    
    internal lazy var subheadingLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "Bukti pendaftaran akan\ndikirim ke email Anda")
        label.textAlignment = .center
        return label
    }()
    
    internal lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [image, headingLabel, subheadingLabel])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 20
        stack.backgroundColor = .contentBG
        stack.addDressing(useShadow: true, useCornerRadius: true, useBorder: true)
        stack.layoutMargins = UIEdgeInsets(top: 40, left: 20, bottom: 24, right: 40)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    internal lazy var button: GButton = {
        let button = GButton(style: .primary, buttonText: "Kembali ke Home", selector: #selector(handleToHomeButton), target: self)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleToHomeButton() {
        
        let vc = UINavigationController(rootViewController: HomeVC())
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(StaticVariables.bottomPadding())
        }
    }
    
    private func updateColors() {
        self.stack.addDressing(useShadow: true, useCornerRadius: true, useBorder: true)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
    }
}
