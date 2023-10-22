//
//  HomeViewController.swift
//  Daily News
//
//  Created by Daniel Frimpong on 13/10/2023.
//

import UIKit
import SafariServices

class HomeViewController: UIViewController, UITableViewDelegate{
   
    

    private let networkRequest = NetworkRequests()
    var articles: [Article] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none

        tableView.register(CompactNewsItemTableViewCell.self, forCellReuseIdentifier: CompactNewsItemTableViewCell.cellId)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        networkRequest.getTopHeadlines{res in
            self.handle(response: res, onSuccess: {news in
                self.articles = news.articles
                self.tableView.reloadData()
            })
        }
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
   
    

    

}


private extension HomeViewController{
   
    private func setup(){
        
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}


extension HomeViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompactNewsItemTableViewCell.cellId, for:   indexPath) as! CompactNewsItemTableViewCell
        cell.selectionStyle = .none
        let article = self.articles[indexPath.row]
        cell.configure(with: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        
        let sfSafariViewController = SFSafariViewController(url: URL(string: article.url)!)
        present(sfSafariViewController, animated: true)
        
    }
    
}
