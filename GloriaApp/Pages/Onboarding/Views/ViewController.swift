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
    private lazy var label: GLabel = {
        let label = GLabel(style: .subtitleText, textString: "Hello, world!")
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .contentBG
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

