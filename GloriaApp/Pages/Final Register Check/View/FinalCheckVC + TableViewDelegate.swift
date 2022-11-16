//
//  FinalCheckVC + TableViewDelegate.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import UIKit

extension FinalCheckVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FinalCheckHeaderTableViewCell.identifier) as! FinalCheckHeaderTableViewCell
            cell.configureUI()
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChosenEventTableViewCell.identifier) as! ChosenEventTableViewCell
            cell.configureUI()
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DataDiriPengunjungTableViewCell.identifier) as! DataDiriPengunjungTableViewCell
            cell.configureUI()
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier) as! ButtonTableViewCell
        cell.configureUI()
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
}
