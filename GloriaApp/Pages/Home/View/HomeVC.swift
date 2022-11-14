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
        configureNavigation()
    }
    
    // MARK: - Selectors
    @objc func handleButton() {
        print("DEBUG: Hello, world!")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        
        let button1 = ReusableHomePageButton(type: .cutToCut, selector: #selector(handleButton), target: self)
        let button2 = ReusableHomePageButton(type: .churchEvents, selector: #selector(handleButton), target: self)
        let button3 = ReusableHomePageButton(type: .lectioDivina, selector: #selector(handleButton), target: self)
        
        let homePageButtonStack = UIStackView(arrangedSubviews: [button1, button2, button3])
        homePageButtonStack.axis = .vertical
        homePageButtonStack.spacing = 6
        
        view.addSubview(homePageButtonStack)
        homePageButtonStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    func configureNavigation() {
        
        self.title = "Shalom"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .backgroundColor
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.textColor ?? UIColor.label,
            .font: UIFont.largeTitle1()
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.textColor ?? UIColor.label,
            .font: UIFont.heading2()
        ]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        
        navigationController?.navigationBar.tintColor = UIColor.primaryColor
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
