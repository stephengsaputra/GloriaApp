//
//  FinalCheckVCDelegates.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 19/11/22.
//

import UIKit

protocol FinalCheckVCDelegate: AnyObject {
    
    func showAlert()
    func navigateToOutput()
}

extension FinalCheckVC: FinalCheckVCDelegate {
    
    func showAlert() {
        
        let vc = TCRegisterAlertVC()
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    func navigateToOutput() {
        
        self.navigationController?.pushViewController(OutputRegisterEventVC(), animated: true)
    }
}


