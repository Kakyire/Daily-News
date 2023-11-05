//
//  ViewControllerExt.swift
//  Daily News
//
//  Created by Daniel Frimpong on 18/10/2023.
//

import Foundation
import Alamofire
import UIKit

extension UIViewController{
    
    
    func handle<T>(response:DataResponse<T,AFError>,progressIndicator:UIActivityIndicatorView? = nil,onSuccess: @escaping (T)->Void){
    
        switch (response.result){
        case .success(let data):
            onSuccess(data)
            progressIndicator?.stopAnimating()
            break
        case .failure(let error):
            progressIndicator?.stopAnimating()
            let message:String
            let errorMessage = error.localizedDescription
            
            if errorMessage.contains("Internet") || errorMessage.contains("server") {
                message =  "No Internet connection"
            }else{
                message =  errorMessage
            }
            
            let alert = UIAlertController( title: nil, message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            break
            
            
        }
    }
    
  
   
    func getTableView() -> UITableView{
        
        let isCompact = UserDefaults.standard.bool(forKey: K.uiStyle)
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(isCompact ? CompactNewsItemCell.self : LargeNewsItemCell.self, forCellReuseIdentifier: isCompact ? CompactNewsItemCell.cellId : LargeNewsItemCell.cellId)
        return tableView
    }
    
    func setup(tableView: UITableView, isCompact:Bool){

        tableView.translatesAutoresizingMaskIntoConstraints = false
                tableView.backgroundColor = .clear
                tableView.rowHeight = UITableView.automaticDimension
                tableView.estimatedRowHeight = 44
                tableView.separatorStyle = .none
                tableView.showsVerticalScrollIndicator = false
                tableView.register(isCompact ? CompactNewsItemCell.self : LargeNewsItemCell.self, forCellReuseIdentifier: isCompact ? CompactNewsItemCell.cellId : LargeNewsItemCell.cellId)
        self.view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func setup(tableView: UITableView,progressIndicator:UIActivityIndicatorView?=nil,tableViewFooter:UIView? = nil){
   
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.isHidden = true
        tableView.tableFooterView = tableViewFooter
        tableView.refreshControl = UIRefreshControl()
        tableView.showsVerticalScrollIndicator = false
        tableView.register( LargeNewsItemCell.self, forCellReuseIdentifier:LargeNewsItemCell.cellId)
        self.view.addSubview(tableView)
        
        if let indicator = progressIndicator {
            indicator.center = self.view.center
            
            view.addSubview(indicator)
        }
       
        
        NSLayoutConstraint.activate([
          
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    
    
}






