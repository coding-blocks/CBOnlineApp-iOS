//
//  MyCoursesViewController.swift
//  CBOnlineIos
//
//  Created by Pushpinder Pal Singh on 23/06/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

class MyCoursesViewController: UIViewController {

    @IBOutlet weak var recentlyAdded: UIButton!
    override func viewDidLoad() {
           super.viewDidLoad()
          
           self.view = view
           setUPCardView()
           setupanimationbutton()
       }
       let cardView = UIView()
       
       let recentlyAccessed  = UIButton()
       let expiredCourses = UIButton()
       let freeTrials = UIButton()
       let allCourses = UIButton()
       let premium = UIButton()
       let active = UIButton()
       var cardViewBottom : NSLayoutConstraint!
       
       func setUPCardView(){
           view.addSubview(cardView)
           cardView.backgroundColor = .black
           cardView.layer.cornerRadius = 12
           setupCardViewConstrains()
           setUpRecentlyButton()
       }
       
       func setUpRecentlyButton() {
           cardView.addSubview(recentlyAccessed)
           recentlyAccessed.setTitle("Recently Added", for: .normal)
           
       }
       
       func setupanimationbutton(){
           recentlyAdded.addTarget(self, action: #selector(animate), for: .touchUpInside)
       }
       @objc func animate(){
           cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
           UIView.animate(withDuration: 0.4) {
               self.view.layoutIfNeeded()
           }
       }
       
       
       func setupCardViewConstrains(){
           cardView.translatesAutoresizingMaskIntoConstraints = false
           cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
           cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
           cardView.heightAnchor.constraint(equalToConstant: 360).isActive = true
           cardViewBottom = cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 500)
           cardViewBottom.isActive = true
       }
       
}
