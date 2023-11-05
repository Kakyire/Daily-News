//
//  TechScreen.swift
//  Daily News
//
//  Created by Daniel Frimpong on 29/10/2023.
//

import UIKit
import SafariServices

class TechScreen: UIViewController , UITableViewDelegate{

    private var isLoading = false
    private var currentPage = 1
    private var isCompact = UserDefaults.standard.bool(forKey: K.uiStyle)
    private let networkRequest = NetworkRequests()
    var articles: [Article] = []
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    private lazy var tableView = getTableView()
    private let footerView = FooterLoadingIndicator()

    
    @objc fileprivate func getNews() {
        networkRequest.getNews(for: K.tech, complete: { res in
            self.handle(response: res, onSuccess: {news in
                self.articles = news.articles
                self.tableView.reloadData()
                self.tableView.isHidden = false
                
            })})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        tableView.delegate = self
        tableView.dataSource = self
        getNews()
    }
    
    
    override func loadView() {
        super.loadView()
        setup(tableView: tableView,progressIndicator: activityIndicator)
        tableView.refreshControl?.addTarget(self, action: #selector(getNews), for: .valueChanged)

    }
    
    
}

extension TechScreen: UITableViewDataSource{
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height
        
        if contentOffsetY + screenHeight >= contentHeight {
            
            if !isLoading {
                currentPage += 1
                footerView.showIndicator()
                networkRequest.getNews(for: K.tech, page: currentPage, complete: {res in
                    self.isLoading = true
                    self.handle(response: res,progressIndicator: self.activityIndicator,onSuccess: {news in
                        self.articles += news.articles
                        self.tableView.reloadData()
                        self.footerView.hideIndicator()
                        self.isLoading = false
                        
                    })
                })
            }
        }
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LargeNewsItemCell.cellId, for: indexPath) as! LargeNewsItemCell
        cell.setViews(with: self.articles[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        
        let sfSafariViewController = SFSafariViewController(url: URL(string: article.url)!)
        present(sfSafariViewController, animated: true)
        
    }
    
    private func getTableCell(for tableView:UITableView, indexPath: IndexPath)  -> UITableViewCell{
        if isCompact {
            let cell = tableView.dequeueReusableCell(withIdentifier: CompactNewsItemCell.cellId, for: indexPath) as! CompactNewsItemCell
            cell.configure(with: self.articles[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: LargeNewsItemCell.cellId, for: indexPath) as! LargeNewsItemCell
            cell.setViews(with: self.articles[indexPath.row])
            return cell
        }
    }
    
}
