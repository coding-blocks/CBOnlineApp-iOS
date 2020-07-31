import Foundation
import UIKit

class CustomHorizontalProgressView: UIView {
    var progress: CGFloat = 0.0 {
        
        didSet {
            setProgress()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setProgress()
    }
    
    func setProgress() {
        var progress = self.progress
        progress = progress > 1.0 ? progress / 100 : progress
        
        self.layer.cornerRadius = self.frame.height / 2.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
        
        let margin: CGFloat = 6.0
        var width = (self.frame.width - margin)  * progress
        let height = self.frame.height - margin
        
        if (width < height) {
            width = height
        }
        
        let path = UIBezierPath(roundedRect: CGRect(x: margin / 2.0, y: margin / 2.0, width: width, height: height),cornerRadius: height / 2.0)

        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = path.bounds
        
        if progress < 0.9 {
            gradient.colors = [UIColor(red: 0.87, green: 0.43, blue: 0.38, alpha: 1).cgColor, UIColor(red: 0.937, green: 0.6, blue: 0.325, alpha: 1).cgColor]
        }
        
        else {
            gradient.colors = [UIColor(red: 0.513, green: 0.85, blue: 0.231, alpha: 1).cgColor, UIColor(red: 0.149, green: 0.658, blue: 0.486, alpha: 1).cgColor]
        }
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = height / 2.0
        
        self.layer.addSublayer(gradient)
        
    }
}

