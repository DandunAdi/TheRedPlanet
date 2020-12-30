//
//  BackButton.swift
//  The Red Planet
//
//  Created by DDD on 31/12/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class BackButton: UIButton {
      
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    
    private func configureUI() {
        setImage(UIImage(systemName: "chevron.left"), for: .normal)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold)
        setPreferredSymbolConfiguration(symbolConfig, forImageIn: .normal)
        tintColor = .white
        setDimensions(height: 40, width: 40)
        layer.borderWidth = 1
        layer.cornerRadius = 40 / 2
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

