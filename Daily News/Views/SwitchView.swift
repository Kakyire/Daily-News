//
//  SwitchView.swift
//  Daily News
//
//  Created by Daniel Frimpong on 30/10/2023.
//

import UIKit

class SwitchView: UIView {

    var title = ""
    var fontSize:CGFloat = 16
    var fontWeight:UIFont.Weight = .regular
    
    private lazy var label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = .systemFont(ofSize: fontSize,weight: fontWeight)
        return label
    }()
    
    private lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        return uiSwitch
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    private func configure(){
        
        self.addSubview(label)
        self.addSubview(uiSwitch)
        
        NSLayoutConstraint.activate([
            uiSwitch.topAnchor.constraint(equalTo: self.topAnchor),
            uiSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: uiSwitch.leadingAnchor),

        ])
        
    }
}
