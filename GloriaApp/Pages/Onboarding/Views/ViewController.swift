//
//  ViewController.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 12/11/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var button: GButton = {
        let button = GButton(style: .primaryDisabled, buttonText: "test", selector: #selector(handleButton), target: self)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.3) {
                self.button.makeDisabled(isDisabled: false)
            }
        }
    }
    
    // MARK: - Selectors
    @objc func handleButton() {
        print("DEBUG: Hello, world!")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .contentBG
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

