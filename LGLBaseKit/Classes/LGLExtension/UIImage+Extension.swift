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

    /**图片拉伸 指定
       edgeInset 指定不被拉伸的区域
        imageName 图片名称
        resizeMode UIImageResizingModeTile,//进行区域复制模式拉伸 【-】 -> 【-】【-】【-】
        resizeMode UIImageResizingModeStretch,//进行渐变复制模式拉伸 连续的 【-】 -> 【-----】
     */
    func lgl_stretchImage(_ edgeInset:UIEdgeInsets, _ resizeMode: UIImage.ResizingMode) -> UIImage {
        return self.resizableImage(withCapInsets:edgeInset, resizingMode: resizeMode)
    }
}
