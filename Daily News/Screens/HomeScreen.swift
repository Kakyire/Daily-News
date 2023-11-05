//
//  HomeViewController.swift
//  Daily News
//
//  Created by Daniel Frimpong on 13/10/2023.
//

import UIKit
import SafariServices

class HomeScreen: UIViewController, UITableViewDelegate{
   
    private var isCompact = UserDefaults.standard.bool(forKey: K.uiStyle)
    private let networkRequest = NetworkRequests()
    var articles: [Article] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(isCompact ? CompactNewsItemCell.self : LargeNewsItemCell.self, forCellReuseIdentifier: isCompact ? CompactNewsItemCell.cellId : LargeNewsItemCell.cellId)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Daily News"
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        networkRequest.getTopHeadlines{res in
            self.handle(response: res, onSuccess: {news in
                self.articles = news.articles
                self.tableView.reloadData()
            })
        }
    }
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
   
    

    

}


//MARK: ACTIONS
private extension HomeScreen{
   
    private func setup(){
        registerTableView()

        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let grid = "rectangle.grid.1x2"
        let list = "list.bullet"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: isCompact ? list : grid), style: .plain, target: self, action: #selector(changeUiStyel))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func registerTableView(){
        self.tableView.register(isCompact ? CompactNewsItemCell.self : LargeNewsItemCell.self, forCellReuseIdentifier: isCompact ? CompactNewsItemCell.cellId : LargeNewsItemCell.cellId)

    }
    
    @objc private func changeUiStyel(){
        UserDefaults.standard.setValue(!isCompact, forKey: K.uiStyle)
        registerTableView()
        setup()
        self.tableView.reloadData()
        
    }
}


extension HomeScreen: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = getTableCell(for: tableView, indexPath: indexPath)
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
