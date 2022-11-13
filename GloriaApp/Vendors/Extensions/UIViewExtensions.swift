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
    
    func addShadow(opacity: Float = 1,
                   radius: CGFloat = 32,
                   offset: CGSize = CGSize(width: 0.0, height: 10.0),
                   color: UIColor = .dropShadow ?? .black) {
        
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
