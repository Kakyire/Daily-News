//
//  LargeNewsItemCell.swift
//  Daily News
//
//  Created by Daniel Frimpong on 28/10/2023.
//

import UIKit

class LargeNewsItemCell: UITableViewCell {

    static let cellId = "LargeNewsItemCell"

    // MARK: UI
    private lazy var cardView: CardView = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private lazy var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var articleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16,weight: .light)
        return label
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18,weight: .bold)
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16,weight: .light)
        return label
    }()
    
    
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        constraintViews()
    }
    
    // MARK: Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    private func addViews() {
        self.contentView.addSubview(cardView)
        cardView.addSubview(containerStack)
        containerStack.addArrangedSubview(articleImage)
        containerStack.addArrangedSubview(sourceLabel)
        containerStack.addArrangedSubview(titleLabel)
        containerStack.addArrangedSubview(dateLabel)
        
       

    }
    
    private func constraintViews(){
        
      

        NSLayoutConstraint.activate([
            
//            //cardview constraint
            cardView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 8),
            cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            cardView.leadingAnchor.constraint(equalTo:  self.contentView.leadingAnchor,constant: 8),
            cardView.trailingAnchor.constraint(equalTo:  self.contentView.trailingAnchor, constant: -8),
            
            
            //cardview constraint
            containerStack.topAnchor.constraint(equalTo: self.cardView.topAnchor,constant:16),
            containerStack.bottomAnchor.constraint(equalTo:self.cardView.bottomAnchor, constant: -16),
            containerStack.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: 16),
            containerStack.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -16),
            
            
            
            
            //article image contraints
            articleImage.heightAnchor.constraint(equalToConstant: 200),
            articleImage.widthAnchor.constraint(equalToConstant: 200),

                                     
                                    
                                    ])
    }
    
    
    func setViews(with article:Article){
        titleLabel.text = article.title
        dateLabel.text = DateAndTimeUtils.formatDate(from: article.publishedAt)
        sourceLabel.text = "\(article.author ?? "")"
        articleImage.loadImageWith(urlString: article.urlToImage)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
