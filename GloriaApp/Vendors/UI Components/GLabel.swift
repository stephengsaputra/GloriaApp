//
//  GLabel.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 12/11/22.
//

import UIKit

class GLabel: UILabel {

    enum Style {
        case largeTitle
        case heading1
        case heading2
        case heading3
        case caption1
        case caption2
        case caption3
        case buttonText
        case bodyText
        case subtitleText
    }
    
    // MARK: - Initializers
    public private(set) var style: Style
    public private(set) var textString: String
    
    init(style: Style, textString: String) {
        
        self.style = style
        self.textString = textString
        
        super.init(frame: .zero)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func configureLabel() {
        
        configureLabelText()
        configureLabelStyle()
    }
    
    private func configureLabelText() {
        self.text = textString
    }
    
    private func configureLabelStyle() {
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        switch style {
            case .largeTitle:
                self.font = UIFont.largeTitle()
                paragraphStyle.minimumLineHeight = CGFloat(40)
                paragraphStyle.maximumLineHeight = CGFloat(40)
                self.attributedText = NSAttributedString(
                    string: textString,
                    attributes: [
                        .paragraphStyle: paragraphStyle
                    ])
            case .heading1:
                self.font = UIFont.heading1()
            case .heading2:
                self.font = UIFont.heading2()
                paragraphStyle.minimumLineHeight = CGFloat(20)
                paragraphStyle.maximumLineHeight = CGFloat(20)
                self.attributedText = NSAttributedString(
                    string: textString,
                    attributes: [
                        .paragraphStyle: paragraphStyle
                    ])
            case .heading3:
                self.font = UIFont.heading3()
            case .caption1:
                self.font = UIFont.caption1()
            case .caption2:
                self.font = UIFont.caption2()
                paragraphStyle.minimumLineHeight = CGFloat(21)
                paragraphStyle.maximumLineHeight = CGFloat(21)
                self.attributedText = NSAttributedString(
                    string: textString,
                    attributes: [
                        .paragraphStyle: paragraphStyle
                    ])
            case .caption3:
                self.font = UIFont.caption3()
                paragraphStyle.minimumLineHeight = CGFloat(19.5)
                paragraphStyle.maximumLineHeight = CGFloat(19.5)
                self.attributedText = NSAttributedString(
                    string: textString,
                    attributes: [
                        .paragraphStyle: paragraphStyle
                    ])
            case .buttonText:
                self.font = UIFont.buttonText()
            case .bodyText:
                self.font = UIFont.bodyText()
                paragraphStyle.minimumLineHeight = CGFloat(24)
                paragraphStyle.maximumLineHeight = CGFloat(24)
                self.attributedText = NSAttributedString(
                    string: textString,
                    attributes: [
                        .paragraphStyle: paragraphStyle
                    ])
            case .subtitleText:
                self.font = UIFont.subtitleText()
        }
        
        self.textColor = .textColor
        self.numberOfLines = 100
        self.lineBreakMode = .byWordWrapping
    }
}
