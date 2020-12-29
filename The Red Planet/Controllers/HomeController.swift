//
//  HomeController.swift
//  The Red Planet
//
//  Created by DDD on 23/12/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    private var background: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "home"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "THE RED PLANET"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mars Exploration App"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private var solLabel: UILabel = {
        let label = UILabel()
        label.text = "Sol 2941"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020.12.23"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = true
        
        // Background
        view.addSubview(background)
        background.fillSuperview()
        
        // Title
        let titleStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        titleStack.axis = .vertical
        view.addSubview(titleStack)
        titleStack.transform = CGAffineTransform(rotationAngle: .pi/2)
        titleStack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 100,
                          paddingLeft: -40)
        
        // Menu
        let menu = HomeMenu(sizing: view.frame.width)
        menu.delegate = self
        view.addSubview(menu)
        menu.setHeight(view.frame.width - 30)
        menu.anchor(left: view.leftAnchor,
                    bottom: view.safeAreaLayoutGuide.bottomAnchor,
                    right: view.rightAnchor,
                    paddingLeft: 20,
                    paddingBottom: 20,
                    paddingRight: 20)
        
        // Date Label
        view.addSubview(solLabel)
        solLabel.anchor(left: menu.leftAnchor,
                        bottom: menu.topAnchor,
                        paddingLeft: 10,
                        paddingBottom: 10)
        view.addSubview(dateLabel)
        dateLabel.anchor(bottom: menu.topAnchor,
                         right: menu.rightAnchor,
                         paddingBottom: 10,
                         paddingRight: 10)
    }
    
    
    //MARK: - Action
    
    
    //MARK: - API
    
    
}


//MARK: - HomeMenuDelegate

extension HomeController: HomeMenuDelegate {
    func weatherMenuDidTapped(homeMenu: HomeMenu) {
        navigationController?.pushViewController(WeatherController(), animated: true)
    }
    
    func roverCamMenuDidTapped(homeMenu: HomeMenu) {
    }
    
    func newsMenuDidTapped(homeMenu: HomeMenu) {
    }
    
    func galleryMenuDidTapped(homeMenu: HomeMenu) {
    }
}





