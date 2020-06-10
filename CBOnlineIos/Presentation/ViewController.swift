//
//  ViewController.swift
//  CBOnlineIos
//
//  Created by Pulkit Aggarwal on 10/05/19.
//  Copyright © 2019 Coding Blocks. All rights reserved.
//

import UIKit
import Alamofire
import Japx

class ViewController: UIViewController {
    
    let cardsDeckView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        let cardView = CourseCard(frame: .zero)
        cardView.nameLabel.text = "Android Development"

        cardsDeckView.addSubview(cardView)
        setupLayout()

    }
    
    // MARK:- Fileprivate
    
    fileprivate func setupLayout() {
        view.backgroundColor = .white
        let overallStackView = UIStackView(arrangedSubviews: [cardsDeckView])
        overallStackView.axis = .vertical
        overallStackView.backgroundColor = .blue
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
        overallStackView.fillSuperview()
    }


}

