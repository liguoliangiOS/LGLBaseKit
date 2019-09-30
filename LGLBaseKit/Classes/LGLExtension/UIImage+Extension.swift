//
//  UIImage+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/9/20.
//

import UIKit

public extension UIImage {
    ///根据颜色和尺寸生成图片
    convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        defer { // 当前代码执行退出后被调用,一般会被用来做资源释放或者销毁
            UIGraphicsEndImageContext()
        }
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: aCgImage)
    }
    
    ///图片旋转90度
    func lgl_imageRotate90() -> UIImage {
        return UIImage(cgImage:self.cgImage!,
                       scale:self.scale,
                       orientation: .down)
    }
    
    ///返回原始图片
    func lgl_imageOriginal() -> UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
}
