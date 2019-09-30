//
//  UIView+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//

import UIKit


public extension UIView {
    
    ///初始化View 设置背景颜色
    class func lgl_view(_ backgroundColor: UIColor) -> Self {
        return lgl_basekit_view(backgroundColor)
    }
    
    ///初始化View 设置背景颜色、圆角
    class func lgl_view(_ backgroundColor: UIColor, _ cornerRadius: CGFloat) -> Self {
        return lgl_basekit_view(backgroundColor, cornerRadius)
    }
    
    ///设置View 背景颜色、圆角
    func lgl_view(_ backgroundColor: UIColor, _ cornerRadius: CGFloat)  {
        lgl_basekit_view(backgroundColor, cornerRadius)
    }
    
    /// 水平渐变
    func lgl_horizontalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat) {
        lgl_basekit_horizontalGradientLayer(startColor, endColor, cornerRadius)
    }
    
    /// 垂直渐变
    func lgl_verticalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat) {
        lgl_basekit_verticalGradientLayer(startColor, endColor, cornerRadius)
    }
    
    ///设置多角圆角
    func lgl_roundingCorner(_ corners: UIRectCorner, _ radii: CGFloat) {
        lgl_basekit_roundingCorner(corners, radii)
    }
    
    ///给View添加阴影
    func lgl_shadow( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat) {
        lgl_basekit_shadow(shadowColor, shadowOffset, shadowOpacity, shadowRadius, cornerRadius)
    }
    
    ///给View添加阴影和边框
    func lgl_shadowBorder( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat, _ borderColor: UIColor) {
        lgl_basekit_shadowBorder(shadowColor, shadowOffset, shadowOpacity, shadowRadius, cornerRadius,borderColor)
    }
    
    ///获取当前View的控制器
    func lgl_viewGetcurrentVC() -> UIViewController? {
        return lgl_basekit_viewGetcurrentVC()
    }
    
    ///view转图片
    func lgl_viewToImage() -> UIImage {
        return lgl_basekit_viewToImage()
    }
    
    /// 点击手势(默认代理和target相同)
    func lgl_tapGesture(_ target: Any?,_ action: Selector,_ numberOfTapsRequired: Int = 1) {
        lgl_basekit_tapGesture(target, action, numberOfTapsRequired)
    }
    
    /// 长按手势(默认代理和target相同)
    func lgl_longGesture(_ target: Any?,_ action: Selector,_ minDuration: TimeInterval = 0.5) {
        lgl_basekit_longGesture(target, action, minDuration)
    }
    
    /// 部分圆角
    func lgl_partOfRadius(_ corners: UIRectCorner,_ radius: CGFloat) {
        lgl_basekit_partOfRadius(corners, radius)
    }
    
    /// 截图(带导航则用导航控制器的view或keywindow)
    func lgl_screenshotImage() -> UIImage? {
        return lgl_basekit_screenshotImage()
    }
}

//MARK: --- 获取值

public extension UIView {
    var height:CGFloat {
        get {
            return frame.height
        }
        set(newValue){
            var tempFrame = self.frame
            tempFrame.size.height = newValue
            self.frame = tempFrame
        }
    }
    
    var width:CGFloat {
        get{
            return frame.width
        }
        
        set(newValue){
            var tempFrame = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    var x:CGFloat {
        get{
            return frame.origin.x
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    var centerX:CGFloat {
        get{
            return center.x
        }
        set(newValue){
            var tempCenter = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    var centerY:CGFloat {
        get{
            return center.y
        }
        set(newValue){
            var tempCenter = center
            tempCenter.y = newValue
            center = tempCenter
        }
    }
    
    var y:CGFloat {
        get{
            return frame.origin.y
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    /// left值
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var tempFrame = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    /// top值
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    /// right值
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            var tempFrame = frame
            tempFrame.origin.x = newValue - frame.size.width
            frame = tempFrame
        }
    }
    
    /// bottom值
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            var tempFrame = frame
            tempFrame.origin.y = newValue - frame.size.height
            frame = tempFrame
        }
    }
    
    /// size值
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            var tempFrame = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// origin值
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            var tempFrame = frame
            tempFrame.origin = newValue
            frame = tempFrame
        }
    }
}


//MARK: --- 创建View

fileprivate extension UIView {
    
    class func lgl_basekit_view(_ backgroundColor: UIColor) -> Self {
        let view = self.init()
        view.backgroundColor = backgroundColor
        return view
    }
    
    class func lgl_basekit_view(_ backgroundColor: UIColor, _ cornerRadius: CGFloat) -> Self {
        let view = lgl_basekit_view(backgroundColor)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    func lgl_basekit_view(_ backgroundColor: UIColor, _ cornerRadius: CGFloat)  {
        self.backgroundColor = backgroundColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}



//MARK: --- 常用的方法

fileprivate extension UIView {
    
    /// 点击手势(默认代理和target相同)
    func lgl_basekit_tapGesture(_ target: Any?,_ action: Selector,_ numberOfTapsRequired: Int = 1) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.numberOfTapsRequired = numberOfTapsRequired
        tapGesture.delegate = target as? UIGestureRecognizerDelegate
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    /// 长按手势(默认代理和target相同)
    func lgl_basekit_longGesture(_ target: Any?,_ action: Selector,_ minDuration: TimeInterval = 0.5) {
        let longGesture = UILongPressGestureRecognizer(target: target, action: action)
        longGesture.minimumPressDuration = minDuration
        longGesture.delegate = target as? UIGestureRecognizerDelegate
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(longGesture)
    }
    
    /// 部分圆角
    func lgl_basekit_partOfRadius(_ corners: UIRectCorner,_ radius: CGFloat) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = shapeLayer
    }
    
    /// 截图(带导航则用导航控制器的view或keywindow)
    func lgl_basekit_screenshotImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.bounds.size)
        if self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        } else if self.layer.responds(to: #selector(CALayer.render(in:) )) {
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
        } else {
            return nil
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    ///设置圆角或者边框
    func lgl_basekit_borderRadius(_ cornerRadius: CGFloat, _ masksToBounds: Bool, _ borderColor:UIColor = .clear, _ borderWidth: CGFloat = 0.0)  {
        self.layer.masksToBounds = masksToBounds
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    /// 水平渐变
    func lgl_basekit_horizontalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /// 垂直渐变
    func lgl_basekit_verticalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func lgl_basekit_roundingCorner(_ corners: UIRectCorner, _ radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    ///给View添加阴影
    func lgl_basekit_shadow( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.cornerRadius = cornerRadius
    }
    
    ///给View添加阴影和边框
    func lgl_basekit_shadowBorder( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat, _ borderColor: UIColor) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
    }
    
    ///获取当前View的控制器
    func lgl_basekit_viewGetcurrentVC() -> UIViewController? {
        var nextResponder: UIResponder? = self
        repeat {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        } while nextResponder != nil
        
        return nil
    }
    
    func lgl_basekit_viewToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

