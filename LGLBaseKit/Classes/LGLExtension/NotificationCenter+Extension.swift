//
//  NotificationCenter+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/9/20.
//

import UIKit

public extension NotificationCenter {
    
    static func lgl_addObserver(name: String, object: Any?, queue: OperationQueue?, using: @escaping (Notification) -> Void)  {
        self.default.addObserver(forName: NSNotification.Name.init(rawValue: name), object: object, queue: queue, using: using)
    }
    
    static func lgl_addObserver(_ observer: Any, _ selector: Selector, _ name: String, object anObject: Any?) {
        self.default.addObserver(observer, selector: selector, name: NSNotification.Name.init(rawValue: name), object: anObject)
    }
    
    static func lgl_post(_ notification: Notification) {
        self.default.post(notification)
    }
    
    static func lgl_post(_ name: String, _ object: Any?) {
        self.default.post(name: NSNotification.Name.init(rawValue: name), object: object)
    }
    
    static func lgl_post(_ name: String, _ object: Any?, _ userInfo: [AnyHashable : Any]? = nil) {
        self.default.post(name: NSNotification.Name.init(rawValue: name), object: object, userInfo: userInfo)
    }
    
    static func lgl_removeObserver(_ observer: Any) {
        self.default.removeObserver(observer)
    }
    
    static func lgl_removeObserver(_ observer: Any, name: String, object: Any?) {
        self.default.removeObserver(observer, name: NSNotification.Name.init(rawValue: name), object: object)
    }
}
