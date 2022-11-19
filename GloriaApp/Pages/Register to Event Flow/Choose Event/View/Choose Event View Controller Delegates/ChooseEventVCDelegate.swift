//
//  ChooseEventVCDelegate.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 17/11/22.
//

import UIKit

protocol ChooseEventDelegate: AnyObject {
    
    func showButton(eventName: String, eventType: String, eventLocation: String, eventDateTime: Date)
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
