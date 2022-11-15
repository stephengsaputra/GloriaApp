//
//  ChooseEventVC + TableViewDelegate.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 15/11/22.
//

import UIKit

extension ChooseEventVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
            cell.configureUI()
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier) as! EventTableViewCell
        cell.configureUI()
        cell.delegate = self
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
}
