//
//  ChooseEventVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import UIKit
import SnapKit

protocol ChooseEventDelegate: AnyObject {
    func showButton()
}

class ChooseEventVC: UIViewController {

    // MARK: - Properties
    internal lazy var tableView: UITableView = {
        
        let table = UITableView()
        
        table.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        table.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        table.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .backgroundColor
        
        return table
    }()
    
    internal lazy var button: GButton = {
        let button = GButton(style: .primary, buttonText: "Selanjutnya", selector: #selector(handleButton), target: self)
        button.alpha = 0.0
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureNavigation()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleButton() {
        print("DEBUG: Hello, world!")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    
    func configureNavigation() {
        
        self.title = "Register Event"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .backgroundColor
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.textColor ?? UIColor.label,
            .font: UIFont.heading2()
        ]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        
        navigationController?.navigationBar.tintColor = UIColor.primaryColor
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

extension ChooseEventVC: ChooseEventDelegate {
    
    func showButton() {
        UIView.animate(withDuration: 0.3) {
            self.button.alpha = 1.0
        }
    }
}
