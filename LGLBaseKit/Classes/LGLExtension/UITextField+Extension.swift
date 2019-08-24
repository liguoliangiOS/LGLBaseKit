//
//  UITextField+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//

import UIKit

public extension UITextField {
    
    ///初始化TextField  字体大小、字体颜色、提示文字、边框样式 、背景色
    class func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Self {
        return lgl_basekit_textField(textColor, backgroundColor, font, placeholder, borderStyle)
    }
    
    ///初始化TextField 字体大小、字体颜色、提示文字、边框样式
    class func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Self {
        return lgl_basekit_textField(textColor, font, placeholder, borderStyle)
    }
    
    ///初始化TextField 字体大小、字体颜色、提示文字
    class func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String) -> Self {
        return lgl_basekit_textField(textColor, font, placeholder)
    }
    
    ///初始化TextField 字体大小、字体颜色
    class func lgl_textField(_ textColor: UIColor, _ font: UIFont) -> Self {
        return lgl_basekit_textField(textColor, font)
    }
    
    ///设置TextField 字体大小、字体颜色、提示文字、边框样式、背景色
    func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) {
        lgl_basekit_textField(textColor, backgroundColor, font, placeholder, borderStyle)
    }
    
    ///设置TextField 字体大小、字体颜色、提示文字、背景色
    func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String) {
        lgl_basekit_textField(textColor, backgroundColor, font, placeholder)
    }
    
    ///设置TextField 字体大小、字体颜色、背景色
    func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont) {
        lgl_basekit_textField(textColor, backgroundColor, font)
    }
    
    ///设置TextField 字体大小、字体颜色、提示文字、边框样式
    func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) {
        lgl_basekit_textField(textColor, font, placeholder, borderStyle)
    }
    
    ///设置TextField 字体大小、字体颜色、提示文字
    func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String) {
        lgl_basekit_textField(textColor, font, placeholder)
    }
    
    ///设置TextField 字体大小、字体颜色
    func lgl_textField(_ textColor: UIColor, _ font: UIFont) {
        lgl_basekit_textField(textColor, font)
    }
    
    ///设置Placeholder的字体大小和颜色
    func lgl_textFieldPlaceholder(_ color: UIColor, _ font: UIFont) {
        lgl_basekit_textFieldPlaceholder(color, font)
    }
    
    ///设置LeftView
    func lgl_textFieldSetLeftView(_ leftView: UIView?) {
        lgl_basekit_textFieldSetLeftView(leftView)
    }
    
    ///设置RightView
    func lgl_textFieldSetRightView(_ rightView: UIView?) {
        lgl_basekit_textFieldSetRightView(rightView)
    }
    
    ///修改clear按钮的图片
    func lgl_textFieldChangeClearButton(_ imageName: String) {
        lgl_basekit_textFieldChangeClearButton(imageName)
    }
    
    ///切圆角
    func lgl_textFieldCornerRadius(_ cornerRadius: CGFloat) {
        lgl_basekit_textFieldCornerRadius(cornerRadius)
    }
}



fileprivate extension UITextField {
    
    class func lgl_basekit_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Self {
        let textField = self.init()
        textField.textColor = textColor
        textField.font = font
        textField.placeholder = placeholder
        textField.borderStyle = borderStyle
        textField.backgroundColor = backgroundColor
        return textField
    }
    
    class func lgl_basekit_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Self {
        return lgl_basekit_textField(textColor, .clear, font, placeholder, borderStyle)
    }
    
    class func lgl_basekit_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String) -> Self {
        return lgl_basekit_textField(textColor, font, placeholder, .none)
    }
    
    class func lgl_basekit_textField(_ textColor: UIColor, _ font: UIFont) -> Self {
        return lgl_basekit_textField(textColor, font, "", .none)
    }
    
    //MRK: ----- 实例方法
    
    func lgl_basekit_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) {
        self.textColor = textColor
        self.font = font
        self.placeholder = placeholder
        self.borderStyle = borderStyle
        self.backgroundColor = backgroundColor
    }
    
    func lgl_basekit_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) {
        lgl_basekit_textField(textColor, .clear, font, placeholder, borderStyle)
    }
    
    func lgl_basekit_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String) {
        self.textColor = textColor
        self.font = font
        self.placeholder = placeholder
    }
    
    func lgl_basekit_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String) {
        self.textColor = textColor
        self.font = font
        self.placeholder = placeholder
        self.backgroundColor = backgroundColor
    }
    
    func lgl_basekit_textField(_ textColor: UIColor, _ font: UIFont) {
        self.textColor = textColor
        self.font = font
    }
    
    func lgl_basekit_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont) {
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
    }
    
    func lgl_basekit_textFieldPlaceholder(_ color: UIColor, _ font: UIFont) {
        self.setValue(color, forKeyPath: "_placeholderLabel.textColor")
        self.setValue(font, forKeyPath:"_placeholderLabel.font")
    }
    
    func lgl_basekit_textFieldSetLeftView(_ leftView: UIView?) {
        if leftView != nil  {
            self.leftView = leftView
            self.leftViewMode = .always
        }
    }
    
    func lgl_basekit_textFieldSetRightView(_ rightView: UIView?) {
        if rightView != nil  {
            self.rightView = rightView
            self.rightViewMode = .always
        }
    }
    
    func lgl_basekit_textFieldCornerRadius(_ cornerRadius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    func lgl_basekit_textFieldChangeClearButton(_ imageName: String) {
        if let image = UIImage(named: imageName) {
            let cleaButton:UIButton =  self.value(forKey: "_clearButton") as! UIButton
            cleaButton.setImage(image, for: .normal)
            self.clearButtonMode = .whileEditing
        }
    }
}

