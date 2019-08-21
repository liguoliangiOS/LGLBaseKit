//
//  UILabel+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//


import UIKit

public extension UILabel {
    
    ///初始化label 字体、字体颜色 背景颜色、 字体大小、对齐方式、行数
    class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, backgroundColor, font, textAlignment, numberOfLines)
    }
    
    ///初始化label 字体、字体颜色 字体大小、对齐方式
    class func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, font, textAlignment)
    }
    
    ///初始化label 字体、字体颜色 字体大小、行数
    class func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ numberOfLines: Int) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, font, numberOfLines)
    }
    
    ///初始化label 字体、字体颜色 字体大小
    class func lgl_label(_ text: String, _ textColor: UIColor,  _ font: UIFont) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, .clear,  font)
    }
    
    ///初始化label 字体、字体颜色、背景颜色、 字体大小、对齐方式
    class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, backgroundColor, font, textAlignment)
    }
    
    ///初始化label 字体、字体颜色、背景颜色、 字体大小行数
    class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ numberOfLines: Int) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, backgroundColor, font, numberOfLines)
    }
    
    ///初始化label 字体、字体颜色、背景颜色、 字体大小
    class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, backgroundColor, font)
    }
    
    //MARK: ----- 实例方法
    
    ///设置label 字体、字体颜色、背景颜色、 字体大小、对齐方式、行数
    func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int)  {
        lgl_basekit_label(text, textColor, backgroundColor, font, textAlignment, numberOfLines)
    }
    
    ///设置label 字体、字体颜色、背景颜色、 字体大小、对齐方式
    func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) {
        lgl_basekit_label(text, textColor, backgroundColor, font, textAlignment)
    }
    
    ///设置label 字体、字体颜色、背景颜色、 字体大小、行数
    func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ numberOfLines: Int)  {
        lgl_basekit_label(text, textColor,  backgroundColor, font, numberOfLines)
    }
    
    ///设置label 字体、字体颜色、背景颜色、 字体大小
    func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont) {
        lgl_basekit_label(text, textColor,  backgroundColor, font)
    }
    
    ///设置label 字体、字体颜色、背景颜色、 字体大小、对齐方式、行数
    func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) {
        lgl_basekit_label(text, textColor, .clear, font, textAlignment)
    }
    
    ///设置label 字体、字体颜色、 字体大小、行数
    func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ numberOfLines: Int)  {
        lgl_basekit_label(text, textColor, font, numberOfLines)
    }
    
    ///设置label 字体、字体颜色、 字体大小
    func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont) {
        lgl_basekit_label(text, textColor, font)
    }
    
    ///设置label 切圆角
    func lgl_labelRadius(_ cornerRadius: CGFloat) {
        lgl_basekit_labelRadius(cornerRadius)
    }
    
    ///设置label 边框和边框颜色
    func lgl_labelBorder(_ borderColor: UIColor, _ borderWidth: CGFloat) {
        lgl_basekit_labelBorder(borderColor, borderWidth)
    }
    
    ///设置label 边框、边框颜色、切圆角
    func lgl_labelBorder(_ borderColor: UIColor, _ borderWidth: CGFloat, _ cornerRadius: CGFloat) {
        lgl_basekit_labelBorder(borderColor, borderWidth, cornerRadius)
    }
}





fileprivate extension UILabel {
    
    class func lgl_basekit_classLabel(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int) -> UILabel {
        
        let label = self.init()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.backgroundColor = backgroundColor
        return label
    }
    
    class func lgl_basekit_classLabel(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, .clear, font, textAlignment, 1)
    }
    
    class func lgl_basekit_classLabel(_ text: String, _ textColor: UIColor, _ font: UIFont, _ numberOfLines: Int) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, .clear, font, .left, numberOfLines)
    }
    
    class func lgl_basekit_classLabel(_ text: String, _ textColor: UIColor,  _ font: UIFont) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, .clear,  font, .left, 1)
    }
    
    
    class func lgl_basekit_classLabel(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, backgroundColor, font, textAlignment, 1)
    }
    
    class func lgl_basekit_classLabel(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ numberOfLines: Int) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, backgroundColor, font, .left, numberOfLines)
    }
    
    class func lgl_basekit_classLabel(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont) -> UILabel {
        return lgl_basekit_classLabel(text, textColor, backgroundColor, font, .left, 1)
    }
    
    //MARK: ----- 实例方法
    
    
    func lgl_basekit_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int)  {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.backgroundColor = backgroundColor
    }
    
    func lgl_basekit_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) {
        lgl_basekit_label(text, textColor, backgroundColor, font, textAlignment, 1)
    }
    
    func lgl_basekit_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ numberOfLines: Int)  {
        lgl_basekit_label(text, textColor,  backgroundColor, font, .left, numberOfLines)
    }
    
    func lgl_basekit_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont) {
        lgl_basekit_label(text, textColor,  backgroundColor, font, .left, 1)
    }
    
    func lgl_basekit_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) {
        lgl_basekit_label(text, textColor, .clear, font, textAlignment, 1)
    }
    
    func lgl_basekit_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ numberOfLines: Int)  {
        lgl_basekit_label(text, textColor, .clear, font, .left, numberOfLines)
    }
    
    func lgl_basekit_label(_ text: String, _ textColor: UIColor, _ font: UIFont) {
        lgl_basekit_label(text, textColor, .clear, font, .left, 1)
    }
    
    
    func lgl_basekit_labelRadius(_ cornerRadius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    func lgl_basekit_labelBorder(_ borderColor: UIColor, _ borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func lgl_basekit_labelBorder(_ borderColor: UIColor, _ borderWidth: CGFloat, _ cornerRadius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
}

