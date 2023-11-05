//
//  FooterLoadingIndicator.swift
//  Daily News
//
//  Created by Daniel Frimpong on 04/11/2023.
//

import UIKit

class FooterLoadingIndicator: UIView {

   let indicator = UIActivityIndicatorView()

    

    override func layoutSubviews() {
        super.layoutSubviews()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    func showIndicator(){
        self.indicator.startAnimating()
    }
    
    func hideIndicator(){
        self.indicator.stopAnimating()
    }
}
