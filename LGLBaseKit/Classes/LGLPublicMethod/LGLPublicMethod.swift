//
//  LGLPublicMethod.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//

import UIKit

public extension NSObject {
    
    ///返回原始图片
    class func lgl_originalImage(_ imageName: String) -> UIImage? {
        return lgl_basekit_originalImage(imageName)
    }
    ///返回原始图片
    func lgl_originalImage(_ imageName: String) -> UIImage? {
        return NSObject.lgl_basekit_originalImage(imageName)
    }
    
    ///等比缩放图片获取高度
    class func lgl_imageHeight(_ imageW: CGFloat, _ imageH: CGFloat, _ realW: CGFloat) -> CGFloat {
        return lgl_basekit_imageHeight(imageW, imageH, realW)
    }
    ///等比缩放图片获取高度
    func lgl_imageHeight(_ imageW: CGFloat, _ imageH: CGFloat, _ realW: CGFloat) -> CGFloat {
        return NSObject.lgl_basekit_imageHeight(imageW, imageH, realW)
    }
    
    ///根据root控制器，返回当前控制器
    class func lgl_currentVC() -> UIViewController? {
        return lgl_basekit_currentVC()
    }
    
    ///根据root控制器，返回当前控制器
    func lgl_currentVC() -> UIViewController? {
        return NSObject.lgl_basekit_currentVC()
    }
}



fileprivate extension NSObject {
    
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
}

