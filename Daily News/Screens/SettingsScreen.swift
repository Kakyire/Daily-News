//
//  SearchScreen.swift
//  Daily News
//
//  Created by Daniel Frimpong on 29/10/2023.
//

import UIKit

class SettingsScreen: UIViewController {

    private let defaults = UserDefaults.standard
    private var isCompact = UserDefaults.standard.bool(forKey: K.uiStyle)

    private lazy var cardView: CardView = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private lazy var switchView: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        uiSwitch.addTarget(self, action: #selector(onScreenChange(_:)), for: .valueChanged)
        uiSwitch.isOn = isCompact
        return uiSwitch
    }()
    
    private lazy var switchLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enable Compact Screen"
        label.font = .systemFont(ofSize: 16,weight: .regular)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private func setupUI(){
//        self.view.addSubview(cardView)
        self.view.addSubview(switchView)
        self.view.addSubview(switchLabel)
        
        NSLayoutConstraint.activate([
//            cardView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            cardView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            cardView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            
            switchLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16),
            switchLabel.trailingAnchor.constraint(equalTo: switchView.leadingAnchor,constant: -8),
            switchLabel.centerYAnchor.constraint(equalTo: switchView.centerYAnchor),
//            switchLabel.topAnchor.constraint(equalTo: switchView.topAnchor),
//            switchLabel.bottomAnchor.constraint(equalTo: switchView.bottomAnchor),
            
            
            switchView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            switchView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            switchView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
        
        ])
    }
    

    @objc func onScreenChange(_ sender:UISwitch){
        defaults.setValue(sender.isOn, forKey: K.uiStyle)
        defaults.synchronize()
    }
}
