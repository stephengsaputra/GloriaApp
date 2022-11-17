//
//  ChooseEventVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import UIKit
import SnapKit

protocol ChooseEventDelegate: AnyObject {
    
    func showButton(eventName: String, eventType: String, eventLocation: String, eventDateTime: Date)
}

class ChooseEventVC: UIViewController {

    // MARK: - Properties
    internal lazy var tableView: UITableView = {
        
        let table = UITableView()
        
        table.register(ChooseEventHeaderTableViewCell.self, forCellReuseIdentifier: ChooseEventHeaderTableViewCell.identifier)
        table.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        
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
    
    internal let data = Event.data
    
    internal var eventName = ""
    internal var eventType = ""
    internal var eventLocation = ""
    internal var eventDateTime = Date()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureNavigation()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleButton() {
        navigationController?.pushViewController(FinalCheckVC(
            eventName: self.eventName,
            eventType: self.eventType,
            eventLocation: self.eventLocation,
            eventDateTime: self.eventDateTime), animated: true)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(StaticVariables.bottomPadding())
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
        
        navigationController?.navigationBar.tintColor = UIColor.secondaryButtonColor
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

extension ChooseEventVC: ChooseEventDelegate {
    
    func showButton(eventName: String, eventType: String, eventLocation: String, eventDateTime: Date) {
        UIView.animate(withDuration: 0.2) {
            self.button.alpha = 1.0
        }
        
        self.eventName = eventName
        self.eventType = eventType
        self.eventLocation = eventLocation
        self.eventDateTime = eventDateTime
    }
}
