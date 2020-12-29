//
//  Menu.swift
//  The Red Planet
//
//  Created by DDD on 24/12/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

protocol HomeMenuDelegate: class {
    func weatherMenuDidTapped(homeMenu: HomeMenu)
    func roverCamMenuDidTapped(homeMenu: HomeMenu)
    func newsMenuDidTapped(homeMenu: HomeMenu)
    func galleryMenuDidTapped(homeMenu: HomeMenu)
}

class HomeMenu: UIView {
    
    //MARK: - Properties
    
    weak var delegate: HomeMenuDelegate?
    
    var sizing: CGFloat = 0 {
        didSet { configureUI() }
    }
    
    private lazy var weatherMenu: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "weather"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.alpha = 0.6
        button.addTarget(self, action: #selector(weatherMenuDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var roverMenu: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "rover-cam"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.alpha = 0.6
        button.addTarget(self, action: #selector(roverMenuDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var newsMenu: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "news"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.alpha = 0.6
        button.addTarget(self, action: #selector(newsMenuDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var galleryMenu: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "gallery"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.alpha = 0.6
        button.addTarget(self, action: #selector(galleryMenuDidTapped), for: .touchUpInside)
        return button
    }()
    
    private var weatherMenuLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private var roverMenuLabel: UILabel = {
        let label = UILabel()
        label.text = "Rover Cam"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private var newsMenuLabel: UILabel = {
        let label = UILabel()
        label.text = "News"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private var galleryMenuLabel: UILabel = {
        let label = UILabel()
        label.text = "Gallery"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    
    //MARK: - Lifecycle
    init(sizing: CGFloat) {
        super.init(frame: .zero)
        self.sizing = sizing
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        let height: CGFloat = (sizing / 2) - 20
        // Menu
        let menuStack = UIStackView(arrangedSubviews: [newsMenu, galleryMenu])
        menuStack.spacing = 10
        menuStack.setHeight(height)
        menuStack.backgroundColor = .white
        menuStack.distribution = .fillEqually
        addSubview(menuStack)
        menuStack.anchor(left: self.leftAnchor,
                         bottom: self.bottomAnchor,
                         right: self.rightAnchor)
        
        let secondMenuStack = UIStackView(arrangedSubviews: [weatherMenu, roverMenu])
        secondMenuStack.spacing = 10
        secondMenuStack.setHeight(height)
        secondMenuStack.backgroundColor = .white
        secondMenuStack.distribution = .fillEqually
        addSubview(secondMenuStack)
        secondMenuStack.anchor(left: menuStack.leftAnchor,
                               bottom: menuStack.topAnchor,
                               right: menuStack.rightAnchor,
                               paddingBottom: 10)
        
        addSubview(weatherMenuLabel)
        weatherMenuLabel.anchor(left: weatherMenu.leftAnchor,
                                bottom: weatherMenu.bottomAnchor,
                                paddingLeft: 15,
                                paddingBottom: 20)
        addSubview(roverMenuLabel)
        roverMenuLabel.anchor(left: roverMenu.leftAnchor,
                              bottom: roverMenu.bottomAnchor,
                              paddingLeft: 15,
                              paddingBottom: 20)
        addSubview(newsMenuLabel)
        newsMenuLabel.anchor(left: newsMenu.leftAnchor,
                             bottom: newsMenu.bottomAnchor,
                             paddingLeft: 15,
                             paddingBottom: 20)
        addSubview(galleryMenuLabel)
        galleryMenuLabel.anchor(left: galleryMenu.leftAnchor,
                                bottom: galleryMenu.bottomAnchor,
                                paddingLeft: 15,
                                paddingBottom: 20)
    }
    
    
    //MARK: - Action
    
    @objc func weatherMenuDidTapped() {
        delegate?.weatherMenuDidTapped(homeMenu: self)
    }
    
    @objc func roverMenuDidTapped() {
        delegate?.roverCamMenuDidTapped(homeMenu: self)
    }
    @objc func newsMenuDidTapped() {
        delegate?.newsMenuDidTapped(homeMenu: self)
    }
    @objc func galleryMenuDidTapped() {
        delegate?.galleryMenuDidTapped(homeMenu: self)
    }
    
    
    //MARK: - API
    
    
}

