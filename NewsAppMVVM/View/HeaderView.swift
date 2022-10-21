//
//  HeaderView.swift
//  NewsAppMVVM
//
//  Created by Muhammed Enes Kılıçlı on 19.09.2022.
//

import UIKit

final class HeaderView : UIView {
    
    private var fontsize : CGFloat
    
    private lazy var headingLabel : UILabel = {
        
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.text = "News"
        uiLabel.font = UIFont.boldSystemFont(ofSize: fontsize)
        return uiLabel
    }()
    
    private lazy var headerCircleImage : UIImageView = {
        
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontsize, weight: .bold)
        uiImageView.image = UIImage(systemName: "largecircle.fill.circle", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return uiImageView
        
    }()
    
    private lazy var plusImage: UIImageView = {
        
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: fontsize, weight: .bold)
        uiImageView.image = UIImage(systemName: "plus", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return uiImageView
    }()
    
    private lazy var subHeadLineLabel: UILabel = {
        
       let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.font = uiLabel.font.withSize(fontsize)
        uiLabel.text = "Top Headlines"
        uiLabel.textColor = .gray
        return uiLabel
        
    }()
    
    private lazy var headerStackView: UIStackView = {
        
       let uiStackView = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel,plusImage])
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.axis = .horizontal
        return uiStackView
        
    }()
    
    
    init(fontsize: CGFloat) {
        self.fontsize = fontsize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    func setupView() {
        addSubview(headerStackView)
        addSubview(subHeadLineLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        //News Header
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        //Sub Head Line
        NSLayoutConstraint.activate([
            subHeadLineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subHeadLineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subHeadLineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    
        
    }
    
    
}
