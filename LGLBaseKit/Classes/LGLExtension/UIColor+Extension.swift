//
//  UIColor+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//

import UIKit

public extension UIColor {
    
    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    ///十六进制字符串形式颜色值
    class func lgl_color(_ hex: String) -> UIColor {
        return lgl_basekit_hexColor(hex)
    }
    
    static var lgl_randomColor: UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    ///适配暗黑模式设置颜色 dark -- 暗黑模式下的颜色   light -- 其他模式下的颜色
    class func lgl_traitColor(_ dark:UIColor = .white, _ light:UIColor) -> UIColor {
       if #available(iOS 13.0, *) {
           let color = UIColor{ (traitCollection) -> UIColor in
               if traitCollection.userInterfaceStyle == .dark {
                   return dark
               } else {
                   return light
               }
           }
           return color
       } else {
           return light
       }
    }
}

/// 定义16进制值颜色
fileprivate extension UIColor {
    
    private class func lgl_basekit_hexColor(_ hex: String) -> UIColor {
        var cstr = hex.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if(cstr.length < 6){
            return UIColor.clear;
        }
        if(cstr.hasPrefix("0X")){
            cstr = cstr.substring(from: 2) as NSString
        }
        if(cstr.hasPrefix("#")){
            cstr = cstr.substring(from: 1) as NSString
        }
        if(cstr.length != 6){
            return UIColor.clear;
        }
        var range = NSRange.init()
        range.location = 0
        range.length = 2
        //r
        let rStr = cstr.substring(with: range);
        //g
        range.location = 2;
        let gStr = cstr.substring(with: range)
        //b
        range.location = 4;
        let bStr = cstr.substring(with: range)
        var r :UInt32 = 0x0;
        var g :UInt32 = 0x0;
        var b :UInt32 = 0x0;
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        return
            UIColor.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0);
    }
}


