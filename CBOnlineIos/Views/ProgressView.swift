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
        
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = height / 2.0
        
        self.layer.addSublayer(gradient)
        
    }
}

