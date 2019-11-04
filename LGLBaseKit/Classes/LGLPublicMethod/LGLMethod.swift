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
    ///拨打电话
    public class func callPhone(_ number: String) {
        lgl_basekit_callPhone(number)
    }
    
    /// 跳转appStore 评论
    public class func lgl_appStoreComment(_ appId: String) {
        lgl_basekit_appStoreComment(appId)
    }
    /// 跳转appStore 评论
    public class func appStoreComment(_ appId: String) {
        lgl_basekit_appStoreComment(appId)
    }
    
     /// 金额格式化用组分隔 prefix 自定义前缀(如 $/￥)  separator 分隔符号（如,） groupingSize 分隔位数 maxFractionDigits 小数点后最多位数
    func moneyFormatter(_ money: Double, _ maxFractionDigits: Int, _ prefix:String,  _ separator: String, _ groupingSize: Int) -> String
    {
       return lgl_basekit_moneyFormatter(money: money, maxFractionDigits: maxFractionDigits, prefix: prefix, separator: separator, groupingSize: groupingSize)
    }
    
    /// 金额格式化不用组分隔 prefix 自定义前缀(如 $/￥)  maxFractionDigits 小数点后最多位数
    func amountFormatter(_ money: Double, _ maxFractionDigits: Int, _ prefix:String) -> String {
        return lgl_basekit_amountFormatter(money: money, maxFractionDigits: maxFractionDigits, prefix: prefix)
    }
    
    ///跳转Dic -> JsonStr
    func dicToJsonStr(_ dic: [String: Any]) -> String? {
        return lgl_basekit_dicToJsonStr(dic)
    }
    
    ///图片旋转90度
    func rotationImage90(_ imageName: String) -> UIImage? {
        return lgl_basekit_rotationImage90(imageName)
    }
    
    ///判断文字的格式是否满足条件  characterStr 条件 judgeText需要判断的字符串
    func characterSetWithStr(_ characterStr: String, _ judgeText: String) -> Bool {
        return lgl_basekit_characterSetWithStr(characterStr, judgeText)
    }
    
    /**
    *  压缩上传图片到指定字节
    *  image     压缩的图片
    *  maxLength 压缩后最大字节大小
    *  size 压缩到的尺寸
    *  return 压缩后图片的二进制
    */
    func compressImage(_ image: UIImage, _ maxLength: Int, _ size:CGSize) -> Data? {
        return lgl_basekit_compressImage(image: image, maxLength: maxLength, size: size)
    }
    
    /**
     * 尺寸的重置 重置的size
     */
    func reSetSizeImage(_ size:CGSize, _ image: UIImage) -> UIImage {
        return lgl_basekit_reSizeImage(reSize: size, image: image)
    }
}


private extension LGLMethod {
    

    /**
     *  压缩上传图片到指定字节
     *  image     压缩的图片
     *  maxLength 压缩后最大字节大小
     *  return 压缩后图片的二进制
     */
    func lgl_basekit_compressImage(image: UIImage, maxLength: Int, size:CGSize) -> Data? {
        let newImage =  lgl_basekit_reSizeImage(reSize: CGSize(width: size.width, height: size.height), image: image)
        var compress: CGFloat = 0.9
        var data = newImage.jpegData(compressionQuality: compress)
        
        while data?.count ?? 0 > maxLength && compress > 0.01 {
            compress -= 0.02
            data = newImage.jpegData(compressionQuality: compress)
        }
        
        return data
    }


    /// 尺寸的重置
    func lgl_basekit_reSizeImage(reSize:CGSize, image: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        image.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height));
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }

    
    ///判断文字的格式是否满足
    func lgl_basekit_characterSetWithStr(_ characterStr: String, _ judgeText: String) -> Bool {
          let characterSet = NSCharacterSet(charactersIn: characterStr).inverted
          let filterArr:[String] = judgeText.components(separatedBy: characterSet)
          let filterstr:String = filterArr.joined(separator: "")
          let result:Bool = judgeText == filterstr
          if result {
              return true
          }
          return false
    }
    
    ///图片旋转90度
    func lgl_basekit_rotationImage90(_ imageName: String) -> UIImage? {
        if let orgImage = UIImage(named: imageName) {
            return UIImage(cgImage:orgImage.cgImage!,
                                  scale:orgImage.scale,
                                  orientation: .down)
        }
       return nil
    }
    
    ///跳转Dic -> JsonStr
    func lgl_basekit_dicToJsonStr(_ dic: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            let jsonS = String(data: jsonData, encoding: .utf8)
            return jsonS!
        } catch  {
            print(error)
        }
        return nil
    }
    
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
    
    /// 金额格式化用组分隔 prefix 自定义前缀(如 $/￥)  separator 分隔符号（如,） groupingSize 分隔位数 maxFractionDigits 小数点后最多位数
    func lgl_basekit_moneyFormatter(money: Double, maxFractionDigits: Int, prefix:String,  separator: String, groupingSize: Int) -> String
    {
        let number = NSNumber(value: money)
        let formatter = NumberFormatter()
        // 设置显示样式
        formatter.numberStyle = .decimal
        // 设置小数点后最多2位
        formatter.maximumFractionDigits = maxFractionDigits
        // 设置小数点后最少2位（不足补0）
        formatter.minimumFractionDigits = 0
        // 自定义前缀
        formatter.positivePrefix = prefix
        // 设置用组分隔
        formatter.usesGroupingSeparator = true
        // 分隔符号
        formatter.groupingSeparator = separator
        // 分隔位数
        formatter.groupingSize = groupingSize
        // 格式化
        let format = formatter.string(from: number)
        return format ?? "\(prefix)0.00"
    }
    
    /// 金额格式化不用组分隔 prefix 自定义前缀(如 $/￥)  maxFractionDigits 小数点后最多位数
     func lgl_basekit_amountFormatter(money: Double, maxFractionDigits: Int, prefix:String) -> String
     {
         let number = NSNumber(value: money)
         let formatter = NumberFormatter()
         // 设置显示样式
         formatter.numberStyle = .decimal
         // 设置小数点后最多2位
         formatter.maximumFractionDigits = maxFractionDigits
         // 设置小数点后最少2位（不足补0）
         formatter.minimumFractionDigits = 0
         // 自定义前缀
         formatter.positivePrefix = prefix
         // 设置用组分隔
         formatter.usesGroupingSeparator = false
         // 格式化
         let format = formatter.string(from: number)
         return format ?? "0.00"
     }
}


