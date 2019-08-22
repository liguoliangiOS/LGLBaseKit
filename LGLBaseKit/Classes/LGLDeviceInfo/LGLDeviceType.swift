//
//  LGLDeviceType.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/22.
//

import UIKit


public extension NSObject {
    
    //MARK: ----------------------  获取当前设备分辨率 ----------------------
    
    ///获取当前设备分辨率
    class func lgl_currentPhoneModelSize() -> CGSize {
        return lgl_basekit_currentPhoneModelSize()
    }
    ///获取当前设备分辨率
    func lgl_currentPhoneModelSize() -> CGSize {
        return lgl_basekit_currentPhoneModelSize()
    }
    
    //MARK: ----------------------  比较两个设备的分辨率(跟当前的设备比较) ----------------------
    
    ///比较两个设备的分辨率(跟当前的设备比较)
    class func lgl_phoneEqualTo(_ size: CGSize) -> Bool {
        return lgl_basekit_phoneEqualTo(size)
    }
    ///比较两个设备的分辨率(跟当前的设备比较)
    func lgl_phoneEqualTo(_ size: CGSize) -> Bool {
        return lgl_basekit_phoneEqualTo(size)
    }
    
    //MARK: ----------------------  判断IPad ----------------------
    
    ///判断IPad
    class func lgl_isIPadType() -> Bool {
        return lgl_basekit_isIPadType()
    }
    ///判断IPad
    func lgl_isIPadType() -> Bool {
        return lgl_basekit_isIPadType()
    }
    
    //MARK: ----------------------  判断是否是齐刘海设备系列 ----------------------
    
    ///判断是否是齐刘海设备系列
    class func lgl_isPhoneXType() -> Bool {
        return lgl_basekit_isPhoneXType()
    }
    ///判断是否是齐刘海设备系列
    func lgl_isPhoneXType() -> Bool {
        return lgl_basekit_isPhoneXType()
    }
    
    //MARK: ----------------------  判断6.5Inch iPhone XS Max ----------------------
    
    ///判断6.5Inch iPhone XS Max
    class func lgl_iPhoneInch65() -> Bool {
        return lgl_basekit_iPhoneInch65()
    }
    ///判断6.5Inch iPhone XS Max
    func lgl_iPhoneInch65() -> Bool {
        return lgl_basekit_iPhoneInch65()
    }
    
    //MARK: ----------------------  判断6.1Inch iPhone XR ----------------------
    
    ///判断6.1Inch iPhone XR
    class func lgl_iPhoneInch61() -> Bool {
        return lgl_basekit_iPhoneInch61()
    }
    ///判断6.1Inch iPhone XR
    func lgl_iPhoneInch61() -> Bool {
        return lgl_basekit_iPhoneInch61()
    }
    
    //MARK: ----------------------  判断5.8Inch iPhone XS/ iPhone X ----------------------
    
    ///判断5.8Inch iPhone XS/ iPhone X
    class func lgl_iPhoneInch58() -> Bool {
        return lgl_basekit_iPhoneInch58()
    }
    ///判断5.8Inch iPhone XS/ iPhone X
    func lgl_iPhoneInch58() -> Bool {
        return lgl_basekit_iPhoneInch58()
    }
    
    //MARK: ----------------------  判断5.5Inch iPhone 6/6s/7/8 Plus ----------------------
    
    ///判断5.5Inch iPhone 6/6s/7/8 Plus
    class func lgl_iPhoneInch55() -> Bool {
        return lgl_basekit_iPhoneInch55()
    }
    ///判断5.5Inch iPhone 6/6s/7/8 Plus
    func lgl_iPhoneInch55() -> Bool {
        return lgl_basekit_iPhoneInch55()
    }
    
    //MARK: ----------------------  判断4.7Inch iPhone 6/6s/7/8 ----------------------
    
    ///判断4.7Inch iPhone 6/6s/7/8
    class func lgl_iPhoneInch47() -> Bool {
        return lgl_basekit_iPhoneInch47()
    }
    ///判断4.7Inch iPhone 6/6s/7/8
    func lgl_iPhoneInch47() -> Bool {
        return lgl_basekit_iPhoneInch47()
    }
    
    //MARK: ----------------------  判断4Inch iPhone SE ----------------------
    
    ///判断4Inch iPhone SE
    class func lgl_iPhoneInch4() -> Bool {
        return lgl_basekit_iPhoneInch4()
    }
    ///判断4Inch iPhone SE
    func lgl_iPhoneInch4() -> Bool {
        return lgl_basekit_iPhoneInch4()
    }
}











//MARK: ---------------------------------- 内部具体实现方法 ----------------------------------------





fileprivate extension NSObject {
    
    //MARK: ----  获取当前设备分辨率 ----
    
    class func lgl_basekit_currentPhoneModelSize() -> CGSize {
        if let phoneSize = UIScreen.main.currentMode?.size {
            return phoneSize
        }
        return CGSize.zero
    }
    
    func lgl_basekit_currentPhoneModelSize() -> CGSize {
        if let phoneSize = UIScreen.main.currentMode?.size {
            return phoneSize
        }
        return CGSize.zero
    }
    
    //MARK: ----  比较两个设备的分辨率(跟当前的设备比较) ----
    
    class func lgl_basekit_phoneEqualTo(_ size: CGSize) -> Bool {
        return lgl_basekit_currentPhoneModelSize().equalTo(size)
    }
    
    func lgl_basekit_phoneEqualTo(_ size: CGSize) -> Bool {
        return lgl_basekit_currentPhoneModelSize().equalTo(size)
    }
    
    //MARK: ----  判断IPad ----
    
    class func lgl_basekit_isIPadType() -> Bool {
        let faceIdiom = UIDevice.current.userInterfaceIdiom
        if faceIdiom == .pad {
            return true
        }
        return false
    }
    
    func lgl_basekit_isIPadType() -> Bool {
        let faceIdiom = UIDevice.current.userInterfaceIdiom
        if faceIdiom == .pad {
            return true
        }
        return false
    }
    
    //MARK: ----  判断是否是齐刘海设备系列 ----
    
    class func lgl_basekit_isPhoneXType() -> Bool {
        if (lgl_basekit_iPhoneInch65() || lgl_basekit_iPhoneInch58() || lgl_basekit_iPhoneInch61()) {
            return true
        }
        return false
    }
    
    func lgl_basekit_isPhoneXType() -> Bool {
        if (lgl_basekit_iPhoneInch65() || lgl_basekit_iPhoneInch58() || lgl_basekit_iPhoneInch61()) {
            return true
        }
        return false
    }
    
    //MARK: ----  判断iPhone6.5 iPhone XS Max ----
    
    class func lgl_basekit_iPhoneInch65() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 1242.0, height: 2688.0))
    }
    
    func lgl_basekit_iPhoneInch65() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 1242.0, height: 2688.0))
    }
    
    //MARK: ----  判断iPhone6.1 iPhone XR ----
    
    class func lgl_basekit_iPhoneInch61() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 828.0, height: 1792.0))
    }
    
    func lgl_basekit_iPhoneInch61() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 828.0, height: 1792.0))
    }
    
    //MARK: ----  判断iPhone5.8 iPhone XS/ iPhone X ----
    
    class func lgl_basekit_iPhoneInch58() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 1125.0, height: 2436.0))
    }
    
    func lgl_basekit_iPhoneInch58() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 828.0, height: 1792.0))
    }
    
    //MARK: ----  判断iPhone5.5 iPhone 8 Plus/ iPhone X ----
    
    class func lgl_basekit_iPhoneInch55() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 1242.0, height: 2208.0))
    }
    
    func lgl_basekit_iPhoneInch55() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 828.0, height: 1792.0))
    }
    
    //MARK: ----  判断iPhone4.7 iPhone 6/6s/7/8 ----
    
    class func lgl_basekit_iPhoneInch47() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 750.0, height: 1334.0))
    }
    
    func lgl_basekit_iPhoneInch47() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 750.0, height: 1334.0))
    }
    
    //MARK: ----  判断iPhone4 iPhone SE ----
    
    class func lgl_basekit_iPhoneInch4() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 640.0, height: 1136.0))
    }
    
    func lgl_basekit_iPhoneInch4() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 640.0, height: 1136.0))
    }
}

