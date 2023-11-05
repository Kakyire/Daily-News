//
//  UITableViewExt.swift
//  Daily News
//
//  Created by Daniel Frimpong on 04/11/2023.
//


import UIKit

extension UITableView{
    
    func showFooterView(_ footer:UIView){
      tableFooterView = footer
    }
    
    func hideFooterView (){
        tableFooterView = nil
    }
}
