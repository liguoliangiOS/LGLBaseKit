//
//  LGLAlert.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/9/20.
//

import UIKit

public class LGLAlert {
    
    ///aler提示框
    public static func lgl_alert(_ title: String, _ message: String, _ showTime: TimeInterval = 1.0) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
        lgl_basekit_dissMissAlert(alertVC, showTime)
    }
    
    ///单个按钮的alert提示框
    public static func lgl_alert(_ title: String, _ message: String, _ actionTitle:String, _ actionStyle:UIAlertAction.Style = .default, handler:((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: actionStyle, handler: handler)
        alertVC.addAction(action)
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
    }
    
    ///两个按钮的alert提示框
    public static func lgl_alert(_ title: String, _ message: String, _ cancelTitle:String, cancelHandler:((UIAlertAction) -> Void)? = nil, _ confirmTitle:String, confirmHandler:((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        alertVC.addAction(cancel)
        let confirm = UIAlertAction(title: confirmTitle, style: .default, handler: confirmHandler)
        alertVC.addAction(confirm)
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
    }
    
    ///ationSheet 提示框
    public static func lgl_ationSheet(_ title: String, _ message: String, _ showTime: TimeInterval = 1.0) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
        lgl_basekit_dissMissAlert(alertVC, showTime)
    }
    
    ///单个按钮的ationSheet提示框
    public static func lgl_ationSheet(_ title: String, _ message: String, _ actionTitle:String, _ actionStyle:UIAlertAction.Style = .default, handler:((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: actionTitle, style: actionStyle, handler: handler)
        alertVC.addAction(action)
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
    }
    
    ///两个按钮的ationSheet提示框
    public static func lgl_ationSheet(_ title: String, _ message: String, _ cancelTitle:String, cancelHandler:((UIAlertAction) -> Void)? = nil, _ confirmTitle:String, confirmHandler:((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        alertVC.addAction(cancel)
        let confirm = UIAlertAction(title: confirmTitle, style: .default, handler: confirmHandler)
        alertVC.addAction(confirm)
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
    }
    
    ///一个按钮的filed弹窗
    public static func lgl_field(_ title: String, _ message: String, _ buttonTitle: String, _ fieldHolder:String = "", handler:@escaping ((_ filedValue: String?) -> Void)) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: buttonTitle, style: .default) { (action) in
             let alertStr =  alertVC.textFields![0].text
            handler(alertStr)
        }
        alertVC.addAction(cancel)
        alertVC.addTextField { (textField) in
            textField.placeholder = fieldHolder
        }
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
    }
    
    ///两个按钮的filed弹窗
    public static func lgl_field(_ title: String, _ message: String,_ cancelTitle:String,_ fieldHolder:String = "", cancelHandler:((UIAlertAction) -> Void)? = nil,  _ buttonTitle: String,  confirmHandler:@escaping ((_ filedValue: String?) -> Void)) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        alertVC.addAction(cancel)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { (action) in
            let alertStr =  alertVC.textFields![0].text
            confirmHandler(alertStr)
        }
        alertVC.addAction(okAction)
        alertVC.addTextField { (textField) in
            textField.placeholder = fieldHolder
        }
        lgl_basekit_AlertCurrentVC()?.present(alertVC, animated: true, completion: nil)
    }
}



private extension LGLAlert {
    
    private class func lgl_basekit_dissMissAlert(_ alertVC: UIAlertController, _ showTime: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + showTime, execute: {
            alertVC.dismiss(animated: true, completion: nil)
        })
    }
    
    /// 根据控制器，返回当前控制器
    private class func lgl_basekit_AlertCurrentVC() -> UIViewController? {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
        return lgl_basekit_AlertMapCurrentVC(rootVC: rootVC)
    }
    
    /// 递归找最上面的控制器
    private class func lgl_basekit_AlertMapCurrentVC(rootVC :UIViewController) -> UIViewController? {
        var currentVC: UIViewController?
        if rootVC.presentedViewController != nil {
            currentVC = rootVC.presentedViewController
        } else if rootVC.isKind(of: UITabBarController.self) == true {
            currentVC =  lgl_basekit_AlertMapCurrentVC(rootVC: (rootVC as! UITabBarController).selectedViewController!)
        } else if rootVC.isKind(of: UINavigationController.self) == true {
            currentVC = lgl_basekit_AlertMapCurrentVC(rootVC: (rootVC as! UINavigationController).visibleViewController!)
        } else {
            currentVC = rootVC
        }
        return currentVC
    }
}
