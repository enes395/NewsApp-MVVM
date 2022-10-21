//
//  ShadowImageView.swift
//  NewsAppMVVM
//
//  Created by Muhammed Enes Kılıçlı on 19.09.2022.
//

import UIKit

final class ShadowImageView: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.contentMode = .scaleAspectFill
        uiImageView.layer.cornerRadius = 20
        uiImageView.clipsToBounds = true
         return uiImageView
        
    }()
    
    private lazy var baseView : UIView = {
       
        let uiView = UIView()
        
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .clear
        uiView.layer.shadowColor = UIColor.black.cgColor
        uiView.layer.shadowOffset = CGSize(width: 5, height: 5)
        uiView.layer.shadowOpacity = 0.7
        uiView.layer.shadowRadius = 10.0
        return uiView
        
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(baseView)
        baseView.addSubview(imageView)
        
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        [baseView, imageView].forEach { (uiView) in
            NSLayoutConstraint.activate([
                uiView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
                uiView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                uiView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
                uiView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
            ])
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    
    
}
