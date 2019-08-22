//
//  LGLDeviceInfo.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/22.
//

import UIKit

public extension NSObject {
    
    //MARK: ----------------------  设备整个屏幕的大小 ----------------------
    
    ///设备整个屏幕的大小
    static var lgl_screenBounds: CGRect {
        return lgl_basekit_screenBounds
    }
    ///设备整个屏幕的大小
    var lgl_screenBounds: CGRect {
        return lgl_basekit_screenBounds
    }
    
    //MARK: ----------------------  设备屏幕的宽 ----------------------
    
    ///设备屏幕的宽
    static var lgl_screenWidth: CGFloat {
        return lgl_basekit_screenWidth
    }
    ///设备屏幕的宽
    var lgl_screenWidth: CGFloat {
        return lgl_basekit_screenWidth
    }
    
    //MARK: ----------------------  设备屏幕的高度 ----------------------
    
    ///设备屏幕的高度
    static var lgl_screenHeight: CGFloat {
        return lgl_basekit_screenHeight
    }
    ///设备屏幕的高度
    var lgl_screenHeight: CGFloat {
        return lgl_basekit_screenHeight
    }
    
    //MARK: ----------------------  设备屏幕的倍数 @2x @3x ----------------------
    
    ///设备屏幕的倍数 @2x @3x
    static var lgl_screenScale: CGFloat {
        return lgl_basekit_screenScale
    }
    ///设备屏幕的倍数 @2x @3x
    var lgl_screenScale: CGFloat {
        return lgl_basekit_screenScale
    }
    
    //MARK: ----------------------  导航栏高度 ----------------------
    
    ///导航栏高度
    static var lgl_navigationH: CGFloat {
        return lgl_basekit_navigationH
    }
    ///导航栏高度
    var lgl_navigationH: CGFloat {
        return lgl_basekit_navigationH
    }
    
    //MARK: ---------------------- 状态栏的高度 ----------------------
    
    ///状态栏的高度
    static var lgl_statusBarH: CGFloat {
        return lgl_basekit_statusBarH
    }
    ///状态栏的高度
    var lgl_statusBarH: CGFloat {
        return lgl_basekit_statusBarH
    }
    
    //MARK: ----------------------  navigationBar的高度 ----------------------
    
    ///navigationBar的高度
    static var lgl_navigationBarH: CGFloat {
        return lgl_basekit_navigationBarH
    }
    ///navigationBar的高度
    var lgl_navigationBarH: CGFloat {
        return lgl_basekit_navigationBarH
    }
    
    //MARK: ----------------------  Tabbar的高度 ----------------------
    
    ///Tabbar的高度
    static var lgl_tabBarH: CGFloat {
        return lgl_basekit_tabBarH
    }
    ///Tabbar的高度
    var lgl_tabBarH: CGFloat {
        return lgl_basekit_tabBarH
    }
    
    //MARK: ---------------------- 安全域的高度 ----------------------
    
    ///安全域的高度
    static var lgl_safeAreaH: CGFloat {
        return lgl_basekit_safeAreaH
    }
    ///安全域的高度
    var lgl_safeAreaH: CGFloat {
        return lgl_basekit_safeAreaH
    }
    
    //MARK: ---------------------- 屏幕宽度比例 以iphone6 ----------------------
    
    ///屏幕宽度比例 以iphone6
    static var lgl_widthRatio: CGFloat {
        return lgl_basekit_widthRatio
    }
    ///屏幕宽度比例 以iphone6
    var lgl_widthRatio: CGFloat {
        return lgl_basekit_widthRatio
    }
    
    //MARK: ---------------------- 屏幕高度比例 以iphone6 ----------------------
    
    ///屏幕高度比例 以iphone6
    static var lgl_heightRatio: CGFloat {
        return lgl_basekit_heightRatio
    }
    ///屏幕高度比例 以iphone6
    var lgl_heightRatio: CGFloat {
        return lgl_basekit_heightRatio
    }
}










//MARK: ---------------------------------- 内部具体实现方法 ----------------------------------------

fileprivate extension NSObject {
    
    //MARK: ----  设备整个屏幕的大小 ----
    
    static var lgl_basekit_screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    var lgl_basekit_screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    //MARK: ----  设备屏幕的宽 ----
    
    static var lgl_basekit_screenWidth: CGFloat {
        return lgl_basekit_screenBounds.width
    }
    
    var lgl_basekit_screenWidth: CGFloat {
        return lgl_basekit_screenBounds.width
    }
    
    //MARK: ----  设备屏幕的高度 ----
    
    static var lgl_basekit_screenHeight: CGFloat {
        return lgl_basekit_screenBounds.height
    }
    
    var lgl_basekit_screenHeight: CGFloat {
        return lgl_basekit_screenBounds.height
    }
    
    //MARK: ----  设备屏幕的倍数 @2x @3x ----
    
    static var lgl_basekit_screenScale: CGFloat {
        return UIScreen.main.scale
    }
    
    var lgl_basekit_screenScale: CGFloat {
        return UIScreen.main.scale
    }
    
    //MARK: ----  导航栏高度 ----
    
    static var lgl_basekit_navigationH: CGFloat {
        return lgl_isPhoneXType() ? 88.0 : 64.0
    }
    
    var lgl_basekit_navigationH: CGFloat {
        return lgl_isPhoneXType() ? 88.0 : 64.0
    }
    
    //MARK: ----  状态栏的高度 ----
    
    static var lgl_basekit_statusBarH: CGFloat {
        return lgl_isPhoneXType() ? 44.0 : 20.0
    }
    
    var lgl_basekit_statusBarH: CGFloat {
        return lgl_isPhoneXType() ? 44.0 : 20.0
    }
    
    //MARK: ----  navigationBar的高度 ----
    
    static var lgl_basekit_navigationBarH: CGFloat {
        return 44.0
    }
    
    var lgl_basekit_navigationBarH: CGFloat {
        return 44.0
    }
    
    //MARK: ----  Tabbar的高度 ----
    
    static var lgl_basekit_tabBarH: CGFloat {
        return lgl_isPhoneXType() ? 83.0 : 49.0
    }
    
    var lgl_basekit_tabBarH: CGFloat {
        return lgl_isPhoneXType() ? 83.0 : 49.0
    }
    
    //MARK: ----   安全域的高度 ----
    
    static var lgl_basekit_safeAreaH: CGFloat {
        return lgl_isPhoneXType() ? 34.0 : 0.0
    }
    
    var lgl_basekit_safeAreaH: CGFloat {
        return lgl_isPhoneXType() ? 34.0 : 0.0
    }
    
    //MARK: ----   屏幕宽度比例 以iphone6 ----
    
    static var lgl_basekit_widthRatio: CGFloat {
        return lgl_basekit_screenWidth / 375.0
    }
    
    var lgl_basekit_widthRatio: CGFloat {
        return lgl_basekit_screenWidth / 375.0
    }
    
    //MARK: ----   屏幕高度比例 以iphone6 ----
    
    static var lgl_basekit_heightRatio: CGFloat {
        if lgl_isPhoneXType() || lgl_iPhoneInch55() {
            return 1.0
        } else {
            return (lgl_basekit_screenHeight / 667.0)
        }
    }
    
    var lgl_basekit_heightRatio: CGFloat {
        if lgl_isPhoneXType() || lgl_iPhoneInch55() {
            return 1.0
        } else {
            return (lgl_basekit_screenHeight / 667.0)
        }
    }
}

