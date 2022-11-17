//
//  FinalCheckVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit
import SnapKit

class FinalCheckVC: UIViewController {

    // MARK: - Properties
    internal lazy var tableView: UITableView = {
        
        let table = UITableView()
        
        table.register(FinalCheckHeaderTableViewCell.self, forCellReuseIdentifier: FinalCheckHeaderTableViewCell.identifier)
        table.register(ChosenEventTableViewCell.self, forCellReuseIdentifier: ChosenEventTableViewCell.identifier)
        table.register(DataDiriPengunjungTableViewCell.self, forCellReuseIdentifier: DataDiriPengunjungTableViewCell.identifier)
        table.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .backgroundColor
        
        return table
    }()
    
    var eventName: String
    var eventType: String
    var eventLocation: String
    var eventDateTime: Date
    
    // MARK: - Lifecycle
    init(eventName: String, eventType: String, eventLocation: String, eventDateTime: Date) {
        self.eventName = eventName
        self.eventType = eventType
        self.eventLocation = eventLocation
        self.eventDateTime = eventDateTime
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureNavigation()
        configureUI()
    }
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers
    func configureUI() {
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureNavigation() {
        
        self.title = "Register Event"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .backgroundColor
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.largeTitle1()
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.textColor ?? UIColor.label,
            .font: UIFont.heading2()
        ]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        
        navigationController?.navigationBar.tintColor = UIColor.secondaryButtonColor
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
