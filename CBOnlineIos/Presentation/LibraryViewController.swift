//
//  LibraryViewController.swift
//  CBOnlineIos
//
//  Created by Pushpinder Pal Singh on 01/08/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var LibraryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LibraryTableView.dataSource = self
        LibraryTableView.register(UINib(nibName: "LibraryTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath) as! LibraryTableViewCell
        
        cell.headerLabel.text = "Competitive Programming"
        cell.detailLabel.text = "COOl20JUN"
        cell.courseImage.image = UIImage(named: "courseImage1")
        
        return cell
    }
    
    
}
