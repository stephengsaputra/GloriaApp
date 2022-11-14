//
//  HomeVC.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 13/11/22.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {

    // MARK: - Properties
    internal lazy var tableView: UITableView = {
        
        let table = UITableView()
        
        table.register(VOTDTableViewCell.self, forCellReuseIdentifier: VOTDTableViewCell.identifier)
        table.register(TicketTableViewCell.self, forCellReuseIdentifier: TicketTableViewCell.identifier)
        table.register(HomeButtonTableViewCell.self, forCellReuseIdentifier: HomeButtonTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .backgroundColor
        table.backgroundView = HomeBG()
        
        table.contentInset = UIEdgeInsets(
            top: UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0 > 20 ? 16 : 10,
            left: 0,
            bottom: 0,
            right: 0
        )
        
        return table
    }()
    
    internal lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleProfileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        configureNavigation()
    }
    
    // MARK: - Selectors
    @objc func handleProfileButtonTapped() {
        print("Hello, world!")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureNavigation() {
        
        self.title = "Shalom"
        
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
        
        navigationController?.navigationBar.tintColor = UIColor.primaryColor
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.addSubview(profileButton)
        profileButton.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        profileButton.imageView?.contentMode = .scaleAspectFill
        profileButton.clipsToBounds = true
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileButton.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            profileButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            profileButton.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            profileButton.widthAnchor.constraint(equalTo: profileButton.heightAnchor)
        ])
    }
}
