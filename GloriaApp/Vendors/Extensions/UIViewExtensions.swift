//
//  UIViewExtensions.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 13/11/22.
//

import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func pinToParent(parent: UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        parent.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parent.topAnchor),
            leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
    
    func removeAllSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func addDressing(useShadow: Bool, useCornerRadius: Bool, useBorder: Bool) {
        
        if useShadow {
            layer.shadowOpacity = 1
            layer.shadowRadius = 32
            layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
            layer.shadowColor = UIColor.dropShadow?.cgColor ?? UIColor.black.cgColor
        }
        
        if useCornerRadius {
            layer.cornerRadius = 32
        }
        
        if useBorder {
            layer.borderColor = UIColor.contentBorder?.cgColor
            layer.borderWidth = 1
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
