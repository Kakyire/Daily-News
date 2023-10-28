//
//  UIImageExt.swift
//  Daily News
//
//  Created by Daniel Frimpong on 18/10/2023.
//

import UIKit
import SDWebImage

extension UIImageView{
    
    func loadImageWith(urlString:String?){
        
        
        
        if urlString == nil {
            image = UIImage(systemName: "newspaper")
            setImageSize()
            return
        }
        else{
            if let url = URL(string: urlString!){
                self.sd_setImage(with: url,placeholderImage: UIImage(systemName:"newspaper"))
                setImageSize()
            }
            
        }
    }
    
    
    private func setImageSize (){
        self.contentMode = .scaleAspectFill
        if (self.bounds.size.width > (self.image?.size.width)! && self.bounds.size.height > (self.image?.size.height)!){
            self.contentMode = .scaleAspectFit
        }
    }
}
