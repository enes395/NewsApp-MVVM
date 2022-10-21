//
//  NewsTableViewCell.swift
//  NewsAppMVVM
//
//  Created by Muhammed Enes Kılıçlı on 19.09.2022.
//

import UIKit

final class NewsTableViewCell : UITableViewCell {
    
    var newsVM : NewsViewModel? {
        didSet {
            if let newsVM = newsVM {
                titleLabel.text = newsVM.title
                NetworkManager.shared.getImage(urlString: newsVM.urlToImage) { data in
                    guard let data = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
        
    }
    
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImage.image = UIImage(data: data)
            }
        }
    }
    
    
    private lazy var newsImage: ShadowImageView = {
        let shadowImageView = ShadowImageView()
        shadowImageView.translatesAutoresizingMaskIntoConstraints = false
        return shadowImageView
    }()
    
    private lazy var titleLabel : UILabel = {
       
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.numberOfLines = 0
        return uiLabel
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        addSubview(titleLabel)
        addSubview(newsImage)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        // News Image
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        //Title
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])

        
        
    }
    
    
}
