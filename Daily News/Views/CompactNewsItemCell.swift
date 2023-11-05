//
//  CompactNewsItemTableViewCell.swift
//  Daily News
//
//  Created by Daniel Frimpong on 15/10/2023.
//

import UIKit

class CompactNewsItemCell: UITableViewCell {

    
    static let cellId = "CompactNewsItemCell"
    
    // MARK: UI
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var verticalSubstack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
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
    
    private lazy var articleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    

    func configure(with article:Article){

        containerView.backgroundColor = .quaternaryLabel
        titleLabel.text = article.title
        dateLabel.text = DateAndTimeUtils.formatDate(from: article.publishedAt)
        sourceLabel.text = "\(article.author ?? "")"
        articleImage.loadImageWith(urlString: article.urlToImage)
        
        self.contentView.addSubview(containerView)
        containerView.addSubview(articleImage)
        containerView.addSubview(verticalSubstack)
        verticalSubstack.addArrangedSubview(sourceLabel)
        verticalSubstack.addArrangedSubview(titleLabel)
        verticalSubstack.addArrangedSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -16),
            
            //imageView constraints
            articleImage.heightAnchor.constraint(equalToConstant: 200),
            articleImage.widthAnchor.constraint(equalToConstant: 100),
            articleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            articleImage.topAnchor.constraint(equalTo: self.verticalSubstack.topAnchor,constant: 10),
            articleImage.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor,constant: 10),

            
            verticalSubstack.topAnchor.constraint(equalTo: self.containerView.topAnchor,constant: 16),
            verticalSubstack.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor,constant: -16),
            verticalSubstack.leadingAnchor.constraint(equalTo: self.articleImage.trailingAnchor,constant: 16),
            verticalSubstack.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor,constant: -16),
        ])
    }
    
    
    // MARK: Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
        
    }
}
