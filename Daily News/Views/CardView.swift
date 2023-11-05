//
//  CardView.swift
//  Daily News
//
//  Created by Daniel Frimpong on 28/10/2023.
//

import UIKit

@IBDesignable
class CardView: UIView {

    var cornerRadius:CGFloat = 10
    var cardBackgroundColor: UIColor = .secondarySystemGroupedBackground
    var shadowOffset: CGSize = CGSize(width: 0, height: 5)

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    
    private func configure(){
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = 4
        backgroundColor = cardBackgroundColor
        
    }

}
