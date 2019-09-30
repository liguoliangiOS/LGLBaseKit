//
//  LGLDevice.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/22.
//

import UIKit
import AdSupport

public class LGLDevice {
    
    ///设备整个屏幕的大小
    public static var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    ///设备屏幕的宽
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    ///设备屏幕的高
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    ///设备屏幕的倍数 @2x @3x
    public static var screenScale: CGFloat {
        return UIScreen.main.scale
    }
    
    ///导航栏高度
    public static var navigationHeight: CGFloat {
        return iPhoneXType ? 88.0 : 64.0
    }
    
    /// 状态栏的高度
    public static var statusBarHeight: CGFloat {
        return iPhoneXType ? 44.0 : 20.0
    }
    
    /// navigationBar的高度
    public static var navigationBarHeight: CGFloat {
        return 44.0
    }
    
    /// Tabbar的高度
    public static var tabBarHeight: CGFloat {
        return iPhoneXType ? 83.0 : 49.0
    }
    
    ///底部安全域的高度
    public static var bottomSafeAreaHeight: CGFloat {
        return iPhoneXType ? 34.0 : 0.0
    }
    
    ///屏幕横向适配系数 以iphone6 为基准
    public static var widthRatio: CGFloat {
        return screenWidth / 375.0
    }
    
    /// 屏幕纵向适配系数 以iphone6 为基准
    public static var heightRatio: CGFloat {
        if iPhoneXType || iPhoneInch55 {
            return 1.0
        } else {
            return (screenHeight / 667.0)
        }
    }
    
    ///获取当前设备分辨率
    public static var phoneModelSize: CGSize {
        return lgl_basekit_currentPhoneModelSize()
    }
   
    ///比较两个设备的分辨率(跟当前的设备比较)
    @discardableResult
    public class func phoneEqualTo(_ size: CGSize) -> Bool {
        return lgl_basekit_phoneEqualTo(size)
    }
    
    ///判断IPad
    public static var iPadType: Bool {
        return lgl_basekit_isIPadType()
    }
    
    ///判断是否是齐刘海设备系列
    public static var iPhoneXType: Bool {
        return lgl_basekit_isPhoneXType()
    }
    
    ///判断6.5Inch iPhone XS Max
    public static var iPhoneInch65: Bool {
        return lgl_basekit_iPhoneInch65()
    }
    
    ///判断6.1Inch iPhone XR
    public static var iPhoneInch61: Bool {
        return lgl_basekit_iPhoneInch61()
    }
    
    ///判断5.8Inch iPhone XS/ iPhone X
    public static var iPhoneInch58: Bool {
        return lgl_basekit_iPhoneInch58()
    }
    
    ///判断5.5Inch iPhone 6/6s/7/8 Plus
    public static var iPhoneInch55: Bool {
        return lgl_basekit_iPhoneInch55()
    }
    
    ///判断4.7Inch iPhone 6/6s/7/8
    public static var iPhoneInch47: Bool {
        return lgl_basekit_iPhoneInch47()
    }
   
    ///判断4Inch iPhone SE
    public static var iPhoneInch4: Bool {
        return lgl_basekit_iPhoneInch4()
    }
    
    //MARK: -------   系统配置信息
        
    ///获取系统版本
    public static var systemVersion: String {
        return LGLDeviceSystem.systemVersion
    }
    
    ///获取系统名称
    public static var systemName: String {
        return LGLDeviceSystem.systemName
    }
    
    ///获取系统名称 iPhone", "iPod touch"
    public static var deviceModel: String {
        return LGLDeviceSystem.deviceModel
    }
    
    ///获取系统名称 localized version of model
    public static var deviceLocalizedModel: String {
        return LGLDeviceSystem.deviceLocalizedModel
    }
    
    ///获取设备名称 如 XXX的iphone
    public static var deviceUserName: String {
        return LGLDeviceSystem.deviceUserName
    }
    ///获取总的内存
    public static var deviceDiskTotalSize: String {
        return LGLDeviceSystem.deviceDiskTotalSize
    }
    
    ///获取可用的内存
    public static var deviceAvalibleDiskSize: String {
        return LGLDeviceSystem.deviceAvalibleDiskSize
    }
    
    ///获取运营商
    public static var supplier: String {
        return LGLDeviceSystem.supplier
    }
    
    /// 获取当前设备IP
    public static var deviceIP: String {
        return LGLDeviceSystem.deviceIP
    }
    
    ///获取cpu核数
    public static var deviceCpuCount: Int {
        return LGLDeviceSystem.deviceCpuCount
    }
    
    ///获取cpu类型
    public static var deviceCpuType: String {
        return LGLDeviceSystem.deviceCpuType
    }
    
    ///获取设备名称
    public static var deviceName: String {
        return LGLDeviceSystem.deviceName
    }
    
    // MARK: ------- APP信息
    
    ///App名称 获取失败则返回空字符串
    public static var appName: String  {
        return lgl_basekit_appName()
    }
    
    /// App包名 获取失败则返回空字符串
    public static var appBundleId: String  {
        if let identifier = Bundle.main.bundleIdentifier {
            return identifier
        }
        return ""
    }
    
    /// App版本号 获取失败则返回空字符串
    public static var appVersion: String  {
        if let bundleDic = Bundle.main.infoDictionary, let varsion = bundleDic["CFBundleShortVersionString"] {
            return (varsion as! String)
        }
        return ""
    }
    
    /// AppIdfa 用户关闭，则返回空字符串
    public static var appIdfa: String {
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        return ""
    }
    
    /// AppIdfv 获取失败则返回空字符串
    public static var appIdfv: String {
        if let idForVendor = UIDevice.current.identifierForVendor {
            return idForVendor.uuidString
        }
        return ""
    }
    
    ///app工程名称 获取失败则返回空字符串
    public static var appBundleName:  String {
        return lgl_basekit_appBundleName()
    }
}




private extension LGLDevice {
    
    // MARK: --------------------------- 设备系统信息 ---------------------
    
    ///App名称 获取失败则返回空字符串
     private class func lgl_basekit_appName() -> String  {
        if let bundleDic = Bundle.main.infoDictionary, let name = bundleDic["CFBundleDisplayName"] {
            return (name as! String)
        }
        return ""
    }
    
    /// App包名 获取失败则返回空字符串
     private class func lgl_basekit_appBundleId() -> String  {
        if let identifier = Bundle.main.bundleIdentifier {
            return identifier
        }
        return ""
    }
    
    /// App版本号 获取失败则返回空字符串
     private class func lgl_basekit_appVersion() -> String  {
        if let bundleDic = Bundle.main.infoDictionary, let varsion = bundleDic["CFBundleShortVersionString"] {
            return (varsion as! String)
        }
        return ""
    }
    
    /// AppIdfa 用户关闭，则返回空字符串
     private class func lgl_basekit_appIdfa() -> String {
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        return ""
    }
    
    /// AppIdfv 获取失败则返回空字符串
     private class func lgl_basekit_appIdfv() -> String {
        if let idForVendor = UIDevice.current.identifierForVendor {
            return idForVendor.uuidString
        }
        return ""
    }
    
    ///app工程名称 获取失败则返回空字符串
     private class func lgl_basekit_appBundleName() -> String {
        if let bundleDic = Bundle.main.infoDictionary, let bundleName = bundleDic["CFBundleName"] {
            return (bundleName as! String)
        }
        return ""
    }
    
    
    //MARK: ----  获取当前设备分辨率 ----

    private class func lgl_basekit_currentPhoneModelSize() -> CGSize {
        if let phoneSize = UIScreen.main.currentMode?.size {
            return phoneSize
        }
        return CGSize.zero
    }

    //MARK: ----  比较两个设备的分辨率(跟当前的设备比较) ----
    
    private class func lgl_basekit_phoneEqualTo(_ size: CGSize) -> Bool {
        return lgl_basekit_currentPhoneModelSize().equalTo(size)
    }

    //MARK: ----  判断IPad ----
    
    private class func lgl_basekit_isIPadType() -> Bool {
        let faceIdiom = UIDevice.current.userInterfaceIdiom
        if faceIdiom == .pad {
            return true
        }
        return false
    }

    //MARK: ----  判断是否是齐刘海设备系列 ----
    
    private class func lgl_basekit_isPhoneXType() -> Bool {
        if (lgl_basekit_iPhoneInch65() || lgl_basekit_iPhoneInch58() || lgl_basekit_iPhoneInch61()) {
            return true
        }
        return false
    }
    
    //MARK: ----  判断iPhone6.5 iPhone XS Max ----
    
    private class func lgl_basekit_iPhoneInch65() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 1242.0, height: 2688.0))
    }

    //MARK: ----  判断iPhone6.1 iPhone XR ----
    private class func lgl_basekit_iPhoneInch61() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 828.0, height: 1792.0))
    }

    //MARK: ----  判断iPhone5.8 iPhone XS/ iPhone X ----
    
    private class func lgl_basekit_iPhoneInch58() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 1125.0, height: 2436.0))
    }

    //MARK: ----  判断iPhone5.5 iPhone 8 Plus/ iPhone X ----
    
    private class func lgl_basekit_iPhoneInch55() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 1242.0, height: 2208.0))
    }

    //MARK: ----  判断iPhone4.7 iPhone 6/6s/7/8 ----
    
   private class func lgl_basekit_iPhoneInch47() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 750.0, height: 1334.0))
    }

    //MARK: ----  判断iPhone4 iPhone SE ----
    
    private class func lgl_basekit_iPhoneInch4() -> Bool {
        guard (lgl_basekit_isIPadType() == false) else { return false }
        return lgl_basekit_phoneEqualTo(CGSize(width: 640.0, height: 1136.0))
    }
}

