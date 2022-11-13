//
//  HomeVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 13/11/22.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        
        let views = EmptyTicketView()
        
        view.addSubview(views)
        views.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
