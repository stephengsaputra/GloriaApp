//
//  HomeVC + TableViewDelegate.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 14/11/22.
//

import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: VOTDTableViewCell.identifier) as! VOTDTableViewCell
            cell.configureUI()
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TicketTableViewCell.identifier) as! TicketTableViewCell
            cell.configureUI()
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeButtonTableViewCell.identifier) as! HomeButtonTableViewCell
        cell.configureUI()
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
}
