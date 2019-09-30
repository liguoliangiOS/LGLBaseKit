//
//  LGLMethod.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//

import UIKit

public class LGLMethod {

    ///返回原始图片
    public class func originalImage(_ imageName: String) -> UIImage? {
        return lgl_basekit_originalImage(imageName)
    }
    
    ///等比缩放图片获取高度
    public class func imageHeight(_ imageW: CGFloat, _ imageH: CGFloat, _ realW: CGFloat) -> CGFloat {
        return lgl_basekit_imageHeight(imageW, imageH, realW)
    }
    
    ///根据root控制器，返回当前控制器
    public class func currentVC() -> UIViewController? {
        return lgl_basekit_currentVC()
    }
    
    ///根据颜色生成图片（UIImage）
    public class func imageWithColor(_ color: UIColor, _ size: CGSize) -> UIImage {
        return lgl_basekit_createImageFrom(color, size)
    }
    
    ///打开链接  OpenUrl
    @discardableResult
    public class func openUrl(_ url: URL) -> Bool {
        return lgl_basekit_openUrl(url)
    }
    
    ///拨打电话
    public class func lgl_callPhone(_ number: String) {
        lgl_basekit_callPhone(number)
    }
    
    /// 跳转appStore 评论
    public class func lgl_appStoreComment(_ appId: String) {
        lgl_basekit_appStoreComment(appId)
    }
}


private extension LGLMethod {
    
    ///跳转appStore评分
    class func lgl_basekit_appStoreComment(_ appId: String) {
        let urlStr = "itms-apps://itunes.apple.com/app/id\(appId)?action=write-review"
        if let openUrl = URL(string: urlStr) {
            lgl_basekit_openUrl(openUrl)
        }
    }
    
    ///拨打电话
    class func lgl_basekit_callPhone(_ number: String) {
        let urlString = "tel://\(number)"
        if let url = URL(string: urlString) {
            lgl_basekit_openUrl(url)
        }
    }
    
    ///返回原始图片
    class func lgl_basekit_originalImage(_ imageName: String) -> UIImage? {
        if let image = UIImage(named: imageName) {
            return image.withRenderingMode(.alwaysOriginal)
        }
        return nil
    }
    
    ///等比缩放图片获取高度
    class func lgl_basekit_imageHeight(_ imageW: CGFloat, _ imageH: CGFloat, _ realW: CGFloat) -> CGFloat {
        return (realW * imageH) / imageW
    }
    
    /// 根据控制器，返回当前控制器
    class func lgl_basekit_currentVC() -> UIViewController? {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
        return lgl_basekit_mapCurrentVC(rootVC: rootVC)
    }
    
    /// 递归找最上面的控制器
    class func lgl_basekit_mapCurrentVC(rootVC :UIViewController) -> UIViewController? {
        var currentVC: UIViewController?
        if rootVC.presentedViewController != nil {
            currentVC = rootVC.presentedViewController
        } else if rootVC.isKind(of: UITabBarController.self) == true {
            currentVC =  lgl_basekit_mapCurrentVC(rootVC: (rootVC as! UITabBarController).selectedViewController!)
        } else if rootVC.isKind(of: UINavigationController.self) == true {
            currentVC = lgl_basekit_mapCurrentVC(rootVC: (rootVC as! UINavigationController).visibleViewController!)
        } else {
            currentVC = rootVC
        }
        return currentVC
    }
    
   class func lgl_basekit_createImageFrom(_ color: UIColor, _ size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    ///打开链接  OpenUrl
    @discardableResult
    class func lgl_basekit_openUrl(_ url: URL) -> Bool {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *)  {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            return true
        }
        return false
    }
    
}


