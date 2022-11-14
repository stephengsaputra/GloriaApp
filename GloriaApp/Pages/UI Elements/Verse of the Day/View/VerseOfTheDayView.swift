//
//  VerseOfTheDayView.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 13/11/22.
//

import UIKit
import SnapKit

class VerseOfTheDayView: UIView {

    // MARK: - Properties
    internal lazy var headingLabel: GLabel = {
        let label = GLabel(style: .heading1, textString: "Verse of the Day")
        return label
    }()
    
    internal lazy var verseLabel: GLabel = {
        let label = GLabel(style: .bodyText, textString: "Memang tiap-tiap ganjaran pada waktu ia diberikan tidak mendatangkan sukacita, tetapi dukacita. Tetapi kemudian ia menghasilkan buah kebenaran yang memberikan damai kepada mereka yang dilatih olehnya.")
        return label
    }()
    
    internal lazy var verseNameLabel: GLabel = {
        let label = GLabel(style: .caption1, textString: "Ibrani 12:11")
        return label
    }()
    
    //MARK: - Lifecycle
    required init() {
        
        super.init(frame: .zero)
        
        backgroundColor = .contentBG
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors
    
    
    // MARK: - Helpers
    private func configureUI() {
        
        self.backgroundColor = .contentBG
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: true)
        
        let stack = UIStackView(arrangedSubviews: [headingLabel, verseLabel, verseNameLabel])
        stack.spacing = 10
        stack.alignment = .leading
        stack.axis = .vertical
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
    }
    
    private func updateColors() {
        self.addDressing(useShadow: true, useCornerRadius: true, useBorder: true)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateColors()
        self.setNeedsDisplay()
    }
}
