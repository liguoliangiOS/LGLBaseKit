//
//  UIButton+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//

import UIKit

public extension UIButton {
    
    ////初始化button  设置 标题文字、文字颜色、文字大小
    class func lgl_button(_ title:String, _ titleColor:UIColor, _ backgroundColor: UIColor, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        return lgl_basekit_button(title, titleColor, backgroundColor, font, target, action)
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小
    class func lgl_button(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        return lgl_basekit_button(title, titleColor, font, target, action)
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、图片
    class func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        return lgl_basekit_button(title, titleColor, imageName, font, target, action)
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、背景图片
    class func lgl_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        return lgl_basekit_button(title, titleColor, backgroundImage, font, target, action)
    }
    
    ////初始化button 没有点击  设置 标题文字、文字颜色、文字大小、图片
    class func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont) -> Self {
        return lgl_basekit_button(title, titleColor, imageName, font)
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、选中和未选中图片
    class func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String,  _ selectedImageName: String,  _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        return lgl_basekit_button(title, titleColor, imageName, selectedImageName, font, target, action)
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、选中和未选中背景图片
    class func lgl_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ selectedBackgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        return lgl_basekit_button(title, titleColor, backgroundImage, selectedBackgroundImage, font, target, action)
    }
    
    //MARK: ---- 实例方法
    
    ////设置button 标题文字、文字颜色、文字大小
    func lgl_button(_ title:String, _ titleColor:UIColor, _ backgroundColor: UIColor, _ font:UIFont, _ target:Any, _ action:Selector)  {
        lgl_basekit_button(title, titleColor, backgroundColor, font, target, action)
    }
    
    ////设置button 标题文字、文字颜色、文字大小
    func lgl_button(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ target:Any, _ action:Selector) {
        lgl_basekit_button(title, titleColor, font, target, action)
    }
    
    ////设置button 标题文字、文字颜色、文字大小、图片
    func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont, _ target:Any, _ action:Selector) {
        lgl_basekit_button(title, titleColor, imageName, font, target, action)
    }
    
    ////设置button 标题文字、文字颜色、文字大小、背景图片
    func lgl_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) {
        lgl_basekit_button(title, titleColor, backgroundImage, font, target, action)
    }
    
    ////设置button 没有点击 标题文字、文字颜色、文字大小、图片
    func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont) {
        lgl_basekit_button(title, titleColor, imageName, font)
    }
    
    ///设置图片
    func lgl_buttonImage(_ normalImageName: String, _ selectImageName: String) {
        lgl_basekit_buttonImage(normalImageName, selectImageName)
    }
    
    ///设置背景图片
    func lgl_buttonBackgroundImage(_ normalImageName: String, _ selectImageName: String) {
        lgl_basekit_buttonBackgroundImage(normalImageName, selectImageName)
    }
    
    ///设置圆角
    func lgl_buttonRadius(_ cornerRadius: CGFloat) {
        lgl_basekit_buttonRadius(cornerRadius)
    }
    
    ///设置边框颜色、边框宽度
    func lgl_buttonBorder(_ borderColor: UIColor, _ borderWidth: CGFloat) {
        lgl_basekit_buttonBorder(borderColor, borderWidth)
    }
    
    ///设置边框颜色、边框宽度、圆角
    func lgl_buttonBorder(_ borderColor: UIColor, _ borderWidth: CGFloat, _ cornerRadius: CGFloat) {
        lgl_basekit_buttonBorder(borderColor, borderWidth, cornerRadius)
    }
}


fileprivate extension UIButton {
    
    ////初始化button  设置 标题文字、文字颜色、文字大小
    class func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ backgroundColor: UIColor, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        let button = self.init(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = backgroundColor
        button.addTarget(target, action:action, for: .touchUpInside)
        return button
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小
    class func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        return lgl_basekit_button(title, titleColor, .clear, font, target, action)
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、图片
    class func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        let button = lgl_basekit_button(title, titleColor, .clear, font, target, action)
        if let image = UIImage(named: imageName) {
            button.setImage(image, for: .normal)
        }
        return button
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、选中和未选中图片
    class func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ imageName: String,  _ selectedImageName: String,  _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        let button = lgl_basekit_button(title, titleColor, .clear, font, target, action)
        button.lgl_basekit_buttonImage(imageName, selectedImageName)
        return button
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、背景图片
    class func lgl_basekit_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        let button = lgl_basekit_button(title, titleColor, .clear, font, target, action)
        button.setBackgroundImage(backgroundImage, for: .normal)
        return button
    }
    
    ////初始化button  设置 标题文字、文字颜色、文字大小、选中和未选中背景图片
    class func lgl_basekit_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ selectedBackgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) -> Self {
        let button = lgl_basekit_button(title, titleColor, .clear, font, target, action)
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.setBackgroundImage(selectedBackgroundImage, for: .selected)
        return button
    }
    
    ////初始化button 没有点击  设置 标题文字、文字颜色、文字大小、图片
    class func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont) -> Self {
        let button = self.init(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        if let image = UIImage(named: imageName) {
            button.setImage(image, for: .normal)
        }
        return button
    }
    
    //MARK: ---- 实例方法
    
    ////设置button 标题文字、文字颜色、文字大小
    func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ backgroundColor: UIColor, _ font:UIFont, _ target:Any, _ action:Selector)  {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.addTarget(target, action:action, for: .touchUpInside)
    }
    
    ////设置button 标题文字、文字颜色、文字大小
    func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ target:Any, _ action:Selector) {
        lgl_basekit_button(title, titleColor, .clear, font, target, action)
    }
    
    ////设置button 标题文字、文字颜色、文字大小、图片
    func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont, _ target:Any, _ action:Selector) {
        lgl_basekit_button(title, titleColor, .clear, font, target, action)
        if let image = UIImage(named: imageName) {
            self.setImage(image, for: .normal)
        }
    }
    
    ////设置button 标题文字、文字颜色、文字大小、背景图片
    func lgl_basekit_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) {
        lgl_basekit_button(title, titleColor, .clear, font, target, action)
        self.setBackgroundImage(backgroundImage, for: .normal)
    }
    
    ////设置button 没有点击 标题文字、文字颜色、文字大小、图片
    func lgl_basekit_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        if let image = UIImage(named: imageName) {
            self.setImage(image, for: .normal)
        }
    }
    
    ///设置图片
    func lgl_basekit_buttonImage(_ normalImageName: String, _ selectImageName: String) {
        if let normalImage = UIImage(named: normalImageName) {
            self.setImage(normalImage, for: .normal)
        }
        if let selectImage = UIImage(named: selectImageName) {
            self.setImage(selectImage, for: .selected)
        }
    }
    
    ///设置背景图片
    func lgl_basekit_buttonBackgroundImage(_ normalImageName: String, _ selectImageName: String) {
        if let normalImage = UIImage(named: normalImageName) {
            self.setBackgroundImage(normalImage, for: .normal)
        }
        if let selectImage = UIImage(named: selectImageName) {
            self.setBackgroundImage(selectImage, for: .selected)
        }
    }
    
    ///设置圆角
    func lgl_basekit_buttonRadius(_ cornerRadius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    ///设置边框颜色、边框宽度
    func lgl_basekit_buttonBorder(_ borderColor: UIColor, _ borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    ///设置边框颜色、边框宽度、圆角
    func lgl_basekit_buttonBorder(_ borderColor: UIColor, _ borderWidth: CGFloat, _ cornerRadius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

