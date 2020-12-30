//
//  WeatherController.swift
//  The Red Planet
//
//  Created by DDD on 25/12/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class WeatherController: UIViewController {
    
    //MARK: - Properties
    
    private var background: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "weather-bg"))
        iv.contentMode = .scaleAspectFill
        iv.alpha = 0.6
        return iv
    }()
    
    private lazy var backButton: UIButton = {
        let button = BackButton()
        button.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private var weatherIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "sun.dust.fill"))
        iv.tintColor = .white
        return iv
    }()
    
    private var placeLabel: UILabel = {
        let label = UILabel()
        label.text = "Elysium Planitia"
        label.textColor = .white
        label.font = .systemFont(ofSize: 34, weight: .light)
        return label
    }()
    
    private var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny, Sol 741"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private var highTempLabel: UILabel = {
        let label = UILabel()
        label.text = "-4°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 62, weight: .regular)
        return label
    }()
    
    private var highLabel: UILabel = {
        let label = UILabel()
        label.text = "High"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()
    
    private var lowTempLabel: UILabel = {
        let label = UILabel()
        label.text = "-95°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 62, weight: .regular)
        return label
    }()
    
    private var lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Low"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private var weatherDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather details"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private var seasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Season"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private var currentSeasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Winter"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private var windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private var currentWindLabel: UILabel = {
        let label = UILabel()
        label.text = "0.2 - 12.9 m/s"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private var pressureLabel: UILabel = {
        let label = UILabel()
        label.text = "Presure"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private var currentPressureLabel: UILabel = {
        let label = UILabel()
        label.text = "692.5 - 737 Pa"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .bold)
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
        
        // Background
        view.addSubview(background)
        background.fillSuperview()
        
        // Back Button
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 5,
                          paddingLeft: 20)

        // Main Weather
        let weatherStack = UIStackView(arrangedSubviews: [weatherIcon, placeLabel, weatherLabel])
        weatherStack.axis = .vertical
        weatherStack.alignment = .center
        weatherStack.spacing = 15
        weatherIcon.setDimensions(height: 75, width: 75)
        view.addSubview(weatherStack)
        weatherStack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            left: view.leftAnchor,
                            right: view.rightAnchor,
                            paddingTop: view.frame.height * 0.15,
                            paddingLeft: 40,
                            paddingRight: 40)
        
        // Temperature
        let highTempStack = UIStackView(arrangedSubviews: [highTempLabel, highLabel])
        highTempStack.axis = .vertical
        highTempStack.alignment = .center
        let lowTempStack = UIStackView(arrangedSubviews: [lowTempLabel, lowLabel])
        lowTempStack.axis = .vertical
        lowTempStack.alignment = .center
        
        let tempStack = UIStackView(arrangedSubviews: [highTempStack, lowTempStack])
        tempStack.distribution = .fillEqually
        view.addSubview(tempStack)
        tempStack.anchor(top: weatherStack.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 125,
                         paddingLeft: 20,
                         paddingRight: 20)
        
        // Weather Detail
        view.addSubview(divider)
        divider.setWidth(2)
        divider.anchor(top: tempStack.bottomAnchor,
                       left: view.leftAnchor,
                       bottom: view.bottomAnchor,
                       paddingTop: 70,
                       paddingLeft: 50)
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.2 , 1.0]
        gradient.frame = CGRect(x: 0.0,
                                y: 0.0,
                                width: 2,
                                height: 400)
        divider.layer.insertSublayer(gradient, at: 0)
        
        view.addSubview(weatherDetailsLabel)
        weatherDetailsLabel.anchor(top: divider.topAnchor,
                                   left: divider.rightAnchor,
                                   paddingLeft: 20)
        
        let seasonStack = UIStackView(arrangedSubviews: [seasonLabel, currentSeasonLabel])
        seasonStack.distribution = .equalSpacing
        let windStack = UIStackView(arrangedSubviews: [windLabel, currentWindLabel])
        windStack.distribution = .equalSpacing
        let pressureStack = UIStackView(arrangedSubviews: [pressureLabel, currentPressureLabel])
        pressureStack.distribution = .equalSpacing
        
        
        let weatherDetailsStack = UIStackView(arrangedSubviews: [seasonStack, windStack, pressureStack])
        weatherDetailsStack.axis = .vertical
        weatherDetailsStack.spacing = 10
        view.addSubview(weatherDetailsStack)
        weatherDetailsStack.anchor(top: weatherDetailsLabel.bottomAnchor,
                                   left: weatherDetailsLabel.leftAnchor,
                                   right: view.rightAnchor,
                                   paddingTop: 30,
                                   paddingRight: 30)
        
        
        
        
    }
    
    
    //MARK: - Action
    
    @objc func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - API
    
    
}
