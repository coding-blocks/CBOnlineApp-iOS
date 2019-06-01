//
//  CourseCard.swift
//  CBOnlineIos
//
//  Created by Pulkit Aggarwal on 01/06/19.
//  Copyright © 2019 Coding Blocks. All rights reserved.
//

import UIKit

class CourseCard: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
     let imageView = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
     let nameLabel = UILabel()

    
    fileprivate func setupLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = .blue
        let padding: CGFloat = 16
        let leftStackView = UIStackView(arrangedSubviews: [imageView,nameLabel])
        addSubview(leftStackView)
        leftStackView.axis = .vertical
        leftStackView.distribution = .fillEqually
        leftStackView.spacing  = padding
    
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
