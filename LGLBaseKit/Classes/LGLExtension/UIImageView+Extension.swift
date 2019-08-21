//
//  UIImageView+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//


import UIKit

public extension UIImageView {
    
    ///设置图片初始化
    class func lgl_imagView(_ imageName:String) -> UIImageView {
        return lgl_basekit_imagView(imageName)
    }
    
    ///设置图片和圆角初始化
    class func lgl_imagView(_ imageName:String, _ cornerRadius:CGFloat) -> UIImageView {
        return lgl_basekit_imagView(imageName, cornerRadius)
    }
    
    ///设置图片和圆角、背景色初始化
    class func lgl_imagView(_ imageName:String, _ backgroundColor: UIColor, _ cornerRadius:CGFloat) -> UIImageView {
        return lgl_basekit_imagView(imageName, backgroundColor, cornerRadius)
    }
    
    
    
    ///设置图片
    func lgl_imagView(_ imageName:String)  {
        lgl_basekit_imagView(imageName)
    }
    
    ///设置图片和圆角
    func lgl_imagView(_ imageName:String, _ cornerRadius:CGFloat)  {
        lgl_basekit_imagView(imageName, cornerRadius)
    }
    
    ///设置图片和圆角、背景色
    func lgl_imagView(_ imageName:String, _ backgroundColor: UIColor,  _ cornerRadius:CGFloat)  {
        lgl_basekit_imagView(imageName, backgroundColor, cornerRadius)
    }
    
}

fileprivate extension UIImageView {
    
    class func lgl_basekit_imagView(_ imageName:String) -> UIImageView {
        let imageView = self.init()
        if let image = UIImage(named: imageName) {
            imageView.image = image
        }
        return imageView
    }
    
    class func lgl_basekit_imagView(_ imageName:String, _ cornerRadius:CGFloat) -> UIImageView {
        let imageView = lgl_basekit_imagView(imageName)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = cornerRadius
        return imageView
    }
    
    class func lgl_basekit_imagView(_ imageName:String, _ backgroundColor: UIColor, _ cornerRadius:CGFloat) -> UIImageView {
        let imageView = lgl_basekit_imagView(imageName, cornerRadius)
        imageView.backgroundColor = backgroundColor
        return imageView
    }
    
    
    /// --- 实例方法
    
    func lgl_basekit_imagView(_ imageName:String)  {
        if let image = UIImage(named: imageName) {
            self.image = image
        }
    }
    
    func lgl_basekit_imagView(_ imageName:String, _ cornerRadius:CGFloat)  {
        lgl_basekit_imagView(imageName)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    func lgl_basekit_imagView(_ imageName:String, _ backgroundColor: UIColor,  _ cornerRadius:CGFloat)  {
        lgl_basekit_imagView(imageName, cornerRadius)
        self.backgroundColor = backgroundColor
    }
}


