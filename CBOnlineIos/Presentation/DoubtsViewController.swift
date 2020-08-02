

import UIKit

class DoubtsViewController: UIViewController {
    
    @IBOutlet weak var NavigationBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationBar.layer.cornerRadius = 20
        NavigationBar.layer.borderWidth = 0.2
        
        NavigationBar.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }
    
    
}
