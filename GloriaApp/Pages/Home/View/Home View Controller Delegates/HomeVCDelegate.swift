//
//  HomeVCDelegate.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import Foundation

protocol HomeVCDelegate: AnyObject {
    func navigateToChooseEvent()
}

extension HomeVC: HomeVCDelegate {
    
    func navigateToChooseEvent() {
        self.navigationController?.pushViewController(ChooseEventVC(), animated: true)
    }
}
