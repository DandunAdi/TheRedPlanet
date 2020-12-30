//
//  NewsCell.swift
//  The Red Planet
//
//  Created by DDD on 31/12/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    
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
        backgroundColor = .gray
    }
    
    
    //MARK: - Action
    
    
    //MARK: - API
    
    
}

