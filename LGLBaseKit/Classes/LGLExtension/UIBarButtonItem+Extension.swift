//
//  UIBarButtonItem+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/9/20.
//

import UIKit

public extension UIBarButtonItem {
    
    ///设置图片item 里面已处理保持原图
    static func lgl_item(_ image: UIImage, _ style: UIBarButtonItem.Style = .plain, _ target: Any?, _ action: Selector?) -> UIBarButtonItem  {
        let originalImage = image.withRenderingMode(.alwaysOriginal)
        return UIBarButtonItem(image: originalImage, style: style, target: target, action: action)
    }
    
    ///设置item 标题
    static func lgl_item(_ title: String, _ style: UIBarButtonItem.Style = .plain, _ target: Any?, _ action: Selector?) -> UIBarButtonItem  {
        return UIBarButtonItem(title: title, style: style, target: target, action: action)
    }
}
