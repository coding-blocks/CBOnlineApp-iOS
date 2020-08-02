import UIKit

class MyCoursesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var recentlyAdded: UIButton!
    @IBOutlet weak var MyCourseTableView: UITableView!
    
    var transparentView = UIView()
    var tableView = UITableView()
    let height: CGFloat = UIScreen.main.bounds.height / 2
    
    var settingArray = ["Recently Accessed","Expired Courses","Free Trials","All Courses","Premium","Active"]
    var imageArray = ["play.fill","exclamationmark.triangle","lock","video","star","play"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = view
        MyCourseTableView.dataSource = self
        MyCourseTableView.register(UINib(nibName: "MyCourseTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCourseTableViewCell")
        
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomBottomSheetTableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    @IBAction func recentlyPressed(_ sender: UIButton) {
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        tableView.layer.cornerRadius = 20
        window?.addSubview(tableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
    @IBAction func pleasework(_ sender: Any) {
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        tableView.layer.cornerRadius = 20
        window?.addSubview(tableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
    
    @objc func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
}





extension MyCoursesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == MyCourseTableView {
            return 2
        }
        return settingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == MyCourseTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCourseTableViewCell", for: indexPath) as! MyCourseTableViewCell
            cell.headerLabel.text = "Competitive Programming"
            cell.detailLabel.text = "Mentor:Apaar Kamal and 1 other"
            cell.progressView.progress = 50
            cell.courseImage.image = UIImage(named: "courseImage")
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomBottomSheetTableViewCell
            cell.lbl.font = cell.lbl.font.withSize(20)
            cell.lbl.text = settingArray[indexPath.row]
            if indexPath.row == 0 {
                cell.lbl.textColor = UIColor(red: 0.89, green: 0.482, blue: 0.34, alpha: 1)
            }
            cell.settingImage.image = UIImage(systemName: imageArray[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}
