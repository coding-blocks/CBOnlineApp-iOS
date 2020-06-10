//
//  ButtonBorderGradient.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 10/06/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonBorderGradient: UIButton {
    

     private var borderWidth: CGFloat = 3
     var  gradientLayer = CAGradientLayer()
     var backgroundView = UIView()
    
    @IBInspectable
    var leftGradientColor: UIColor? {
        didSet {
            setupView(leftGradientColor: leftGradientColor, rightGradientColor: rightGradientColor,
                     foregroundColor: backgroundColor)
        }
    }
    
    @IBInspectable
    var rightGradientColor: UIColor? {
        didSet {
            setupView(leftGradientColor: leftGradientColor, rightGradientColor: rightGradientColor,
                      foregroundColor: backgroundColor)
        }
    }
    
    @IBInspectable
    override var backgroundColor: UIColor? {
        didSet {
            setupView(leftGradientColor: leftGradientColor, rightGradientColor: rightGradientColor,
            foregroundColor: backgroundColor)
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    
    internal func setupView(leftGradientColor: UIColor?, rightGradientColor: UIColor?,
    foregroundColor: UIColor?) {
        
        gradientLayer.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        if let leftGradientColor = leftGradientColor, let rightGradientColor = rightGradientColor{
            gradientLayer.frame = bounds
            gradientLayer.colors = [leftGradientColor.cgColor, rightGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            layer.insertSublayer(gradientLayer, at: 0)
        }else{
            gradientLayer.removeFromSuperlayer()
        }
        
        
        backgroundView.removeFromSuperview()
        backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(backgroundView, at: 1)
        backgroundView.backgroundColor = foregroundColor
        backgroundView.fill(toView: self, space: UIEdgeInsets(space: borderWidth))
        
        fb(cornerRadius)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func fb(_ radius: CGFloat) {
        cornerRadius = radius
        createRoundCorner(radius)
        backgroundView.createRoundCorner(radius - borderWidth)
    }
    
    func createBorder(_ width: CGFloat) {
        borderWidth = width
    }
}

extension UIView {
    
    func createRoundCorner(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
extension UIView {
    
    func addConstraint(attribute: NSLayoutConstraint.Attribute, equalTo view: UIView, toAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        
        let myConstraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: view, attribute: toAttribute, multiplier: multiplier, constant: constant)
        return myConstraint
    }
    
    func addConstraints(withFormat format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for i in 0 ..< views.count {
            let key = "v\(i)"
            views[i].translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = views[i]
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    @discardableResult
    public func left(toAnchor anchor: NSLayoutXAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func left(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: view.leftAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func right(toAnchor anchor: NSLayoutXAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func right(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: view.rightAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func top(toAnchor anchor: NSLayoutYAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func top(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func topLeft(toView view: UIView, top: CGFloat = 0, left: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let topConstraint = self.top(toView: view, space: top)
        let leftConstraint = self.left(toView: view, space: left)
        
        return [topConstraint, leftConstraint]
    }
    
    @discardableResult
    public func topRight(toView view: UIView, top: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let topConstraint = self.top(toView: view, space: top)
        let rightConstraint = self.right(toView: view, space: right)
        
        return [topConstraint, rightConstraint]
    }
    
    @discardableResult
    public func bottomRight(toView view: UIView, bottom: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let bottomConstraint = self.bottom(toView: view, space: bottom)
        let rightConstraint = self.right(toView: view, space: right)
        
        return [bottomConstraint, rightConstraint]
    }
    
    @discardableResult
    public func bottomLeft(toView view: UIView, bottom: CGFloat = 0, left: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let bottomConstraint = self.bottom(toView: view, space: bottom)
        let leftConstraint = self.left(toView: view, space: left)
        
        return [bottomConstraint, leftConstraint]
    }
    
    @discardableResult
    public func bottom(toAnchor anchor: NSLayoutYAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func bottom(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func verticalSpacing(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func horizontalSpacing(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = rightAnchor.constraint(equalTo: view.leftAnchor, constant: -space)
        constraint.isActive = true
        return constraint
    }
    
    
    public func size(_ size: CGSize) {
        
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        
    }
    
    public func size(toView view: UIView, greater: CGFloat = 0) {
        widthAnchor.constraint(equalTo: view.widthAnchor, constant: greater).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, constant: greater).isActive = true
    }
    
    public func square(edge: CGFloat) {
        
        size(CGSize(width: edge, height: edge))
    }
    
    public func square() {
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1, constant: 0).isActive = true
    }
    
    @discardableResult
    public func width(_ width: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func width(toDimension dimension: NSLayoutDimension, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }
    
    
    @discardableResult
    public func width(toView view: UIView, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(_ height: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(toDimension dimension: NSLayoutDimension, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(toView view: UIView, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func centerX(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func centerX(toAnchor anchor: NSLayoutXAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    public func center(toView view: UIView, space: CGFloat = 0){
        centerX(toView: view, space: space)
        centerY(toView: view, space: space)
    }
    
    @discardableResult
    public func centerY(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func centerY(toAnchor anchor: NSLayoutYAxisAnchor, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    
    public func horizontal(toView view: UIView, space: CGFloat = 0) {
        
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: space).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: -space).isActive = true
    }
    
    public func horizontal(toView view: UIView, leftPadding: CGFloat, rightPadding: CGFloat) {
        
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftPadding).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: rightPadding).isActive = true
    }
    
    public func vertical(toView view: UIView, space: CGFloat = 0) {
        
        topAnchor.constraint(equalTo: view.topAnchor, constant: space).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -space).isActive = true
    }
    
    public func vertical(toView view: UIView, topPadding: CGFloat, bottomPadding: CGFloat) {
        
        topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomPadding).isActive = true
    }
    
    
    public func fill(toView view: UIView, space: UIEdgeInsets = .zero) {
        
        left(toView: view, space: space.left)
        right(toView: view, space: -space.right)
        top(toView: view, space: space.top)
        bottom(toView: view, space: -space.bottom)
    }
    
    
    
}

extension UIEdgeInsets {
    
    init(space: CGFloat) {
        self.init(top: space, left: space, bottom: space, right: space)
    }
}

