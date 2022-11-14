//
//  HomeVC + ScrollViewDelegate.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 14/11/22.
//

import UIKit

extension HomeVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
    
    func moveAndResizeImage(for height: CGFloat) {
        
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        // Value of difference between icons for large and small states
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
//        profileButton.transform = CGAffineTransform.identity
//            .scaledBy(x: 1/scale, y: 1/scale)
//            .translatedBy(x: xTranslation, y: yTranslation)

        if height < 60 {
            
            UIView.animate(withDuration: 0.1) {
                
//                self.profileButton.alpha = 0
                
                self.title = "Home"
                
                self.tableView.backgroundView?.alpha = 0
                let currentTheme = self.traitCollection.userInterfaceStyle
                
                switch currentTheme {
                    case .dark:
                        UIApplication.shared.statusBarStyle = .lightContent
                    case .light:
                        UIApplication.shared.statusBarStyle = .darkContent
                    default:
                        UIApplication.shared.statusBarStyle = .darkContent
                }
            }
            
        } else {

            UIView.animate(withDuration: 0.1) {
                
//                self.profileButton.alpha = 1
                
                self.title = "Shalom"
                self.tableView.backgroundView?.alpha = 1
                UIApplication.shared.statusBarStyle = .lightContent
            }
            
        }
    }
}

struct Const {
    
    static let ImageSizeForLargeState: CGFloat = 46
    static let ImageRightMargin: CGFloat = 16
    static let ImageBottomMarginForLargeState: CGFloat = 60
    static let ImageBottomMarginForSmallState: CGFloat = 20
    static let ImageSizeForSmallState: CGFloat = 0
    static let NavBarHeightSmallState: CGFloat = 0
    static let NavBarHeightLargeState: CGFloat = 96.5
}

