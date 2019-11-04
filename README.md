# LGLBaseKit

[![CI Status](https://img.shields.io/travis/185226139@qq.com/LGLBaseKit.svg?style=flat)](https://travis-ci.org/185226139@qq.com/LGLBaseKit)
[![Version](https://img.shields.io/cocoapods/v/LGLBaseKit.svg?style=flat)](https://cocoapods.org/pods/LGLBaseKit)
[![License](https://img.shields.io/cocoapods/l/LGLBaseKit.svg?style=flat)](https://cocoapods.org/pods/LGLBaseKit)
[![Platform](https://img.shields.io/cocoapods/p/LGLBaseKit.svg?style=flat)](https://cocoapods.org/pods/LGLBaseKit)

## 前言

本库旨在方便码友便捷获取常用的设备数据、创建控件、快速的搭建应用。 码友可以把常用的方法提供给我，我会在 `LGLMethod`类里面补充。  欢迎加群 457236811 交流。

## Installation

LGLBaseKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

#### 1.全部导入

```ruby

    pod 'LGLBaseKit'
    
```

#### 2.只导入UI相关代码

```ruby

    //只导入与UI相关文件(LGLExtension, LGLDeviceInfo, LGLAlert)
    pod 'LGLBaseKit/LGLBaseUIKit'
     
```
#### 3.单独文件导入

```ruby

    //只导入LGLExtension创建和修改view的扩展方法
    pod 'LGLBaseKit/LGLExtension'
    
    //只导入LGLPublicMethod常用的方法
    pod 'LGLBaseKit/LGLExtension'
    
    //只导入LGLDeviceInfo设备的参数（包括app信息和手机系统信息）
    pod 'LGLBaseKit/LGLDeviceInfo'
    
    //只导入LGLAlert简单封装系统的alert和action弹窗
    pod 'LGLBaseKit/LGLAlert'
    //只导入LGLCrypt加密（Md5加密，AESAES（128+CBC+PKCS7Padding），RSA(SHA1withRSA)加签，验签，加解密等）
    pod 'LGLBaseKit/LGLCrypt'
     
```
## 0.0.8版本更新摘要

1.修复LGLMethod里面用"*"替换文字没有效果
2.LGLMethod新增新的方法。
3.增加 LGLShowText 简单的提示错误文字弹窗
```
    class func showTextView(_ message: String?)
    class func showTextView(_ message: String?, _ textFont: UIFont)
```
4.新增获取屏幕适配比例的方法
```
    /**获取宽度比例  以iphone6 为基准 
    默认屏幕宽度比例大于1（X:1.104）的默认乘以1.02 */
    class func wRatio(ratio: CGFloat = 1.02) -> CGFloat 
 
 /** 获取高度比例 以iphone6 为基准 
    默认屏幕高度比例大于1的 乘以1.02
    （5.8的返回1.0，因为宽度比例是1所以不做高度增加处理）*/
    class func hRatio(ratio: CGFloat = 1.02) -> CGFloat 
```

## 0.0.7版本更新摘要

####  新增可以只导入UI相关的方法

```
    pod 'LGLBaseKit/LGLBaseUIKit'

```

## 0.0.6版本部分重要更新摘要

#### 1. 支持每个部分文件单独导入
#### 2. UIColor新增用于适配`iOS13`的暗黑和其他模式的颜色设置
 ```
    ///适配暗黑模式设置颜色 dark -- 暗黑模式下的颜色   light -- 其他模式下的颜色
    UIColor.lgl_traitColor(darkColor, lightColor) -> UIColor
    UIColor.lgl_traitColor(lightColor) -> UIColor
 ```
#### 3. 修复UITextField在`iOS13`用`KVC`设置`_placeholderLabel`颜色和字体大小，崩溃问题
#### 4. 新增`LGLAlert`系统的提示弹框
#### 5. 新增`LGLCrypt`加密工具


## How to use ?

#### 一、 导入头文件

```
    import LGLBaseKit
```


#### 二、 `LGLDevice`分类包含跟设备相关参数 （屏幕的宽高，设备型号判断，设备的参数， 系统参数等等）

  ```  LGLDevice分类使用： LGLDevice.screenBounds ```
  
#### 1.常用的设备的系数和机型判断
  
 | 属性/变量/方法 | 返回值类型 | 说明 |
 | --- | --- | --- |
  | screenBounds | CGRect  | 设备整个屏幕的大小 |
  | screenWidth  | CGFloat | 设备屏幕的宽 |
  | screenHeight | CGFloat | 设备屏幕的高 |
  | screenScale  | CGFloat | 设备屏幕的倍数 @2x @3x |
  | navigationHeight | CGFloat | 导航栏高度 |
  | statusBarHeight  | CGFloat | 状态栏的高度 |
  | navigationBarHeight | CGFloat | navigationBar的高度 |
  | tabBarHeight | CGFloat | Tabbar的高度 |
  | bottomSafeAreaHeight | CGFloat | 底部安全域的高度 |
  | widthRatio | CGFloat | 屏幕横向适配系数 以iphone6 为基准 |
  | heightRatio | CGFloat | 屏幕纵向适配系数 以iphone6 为基准 |
  | wRatio |  CGFloat | 屏幕横向适配系数 参数默认ratio=1.02 |
  | hRatio |  CGFloat | 屏幕纵向适配系数 参数默认ratio=1.02 |
  | phoneModelSize| CGSize | 获取当前设备分辨率 |
  | phoneEqualTo(_ size: CGSize) | Bool | 比较两个设备的分辨率(跟当前的设备比较) |
  | iPadType | Bool | 判断是否是IPad |
  | iPhoneXType | Bool | 判断是否是齐刘海设备系列 |
  | iPhoneInch65 | Bool | 判断6.5Inch （iPhone XS Max） |
  | iPhoneInch61 | Bool | 判断6.1Inch （iPhone XR） |
  | iPhoneInch58 | Bool |判断5.8Inch （iPhone XS/ iPhone X） |
  | iPhoneInch55 | Bool |判断5.5Inch （iPhone 6/6s/7/8 Plus） |
  | iPhoneInch47 | Bool |判断4.7Inch （iPhone 6/6s/7/8） |
  | iPhoneInch4  | Bool | 判断4Inch （iPhone SE） |
 
 #### 2.系统配置信息
 
  | 属性/变量/方法 | 返回值类型 | 说明 |
  | --- | --- | --- |
  | systemVersion | String | 获取系统版本 |
  | systemName | String | 获取系统名称 |
  | deviceModel | String | 获取系统名称 iPhone", "iPod touch" |
  | deviceLocalizedModel | String | 获取系统名称 localized version of model |
  | deviceUserName | String | 获取设备名称 如 XXX的iphone |
  | deviceDiskTotalSize | String | 获取总的内存 |
  | deviceAvalibleDiskSize | String | 获取可用的内存 |
  | supplier | String | 获取运营商 |
  | deviceIP | String | 获取当前设备IP |
  | deviceCpuCount | Int | 获取cpu核数 |
  | deviceCpuType | String | 获取cpu类型 |
  | deviceName | String | 获取设备名称 |
  
  #### 3.APP信息
  
  | 属性/变量/方法 | 返回值类型 | 说明 |
  | --- | --- | --- |
  | appName |  String  | App名称 获取失败则返回空字符串 | 
  | appBundleId |  String | App包名 获取失败则返回空字符串 |
  | appVersion |  String | App版本号 获取失败则返回空字符串 |
  | appIdfa | String |  AppIdfa 用户关闭，则返回空字符串 |
  | appIdfv | String | AppIdfv 获取失败则返回空字符串 |
  | appBundleName | String | app工程名称 获取失败则返回空字符串 |


####  三、UI控件（绘制阴影，渐变色，View转图片，根据View获取控制器）、颜色、字符串（富文本， 常见的正则判断等）的 Extension 

  `1. UI控件，使用的时候都使用 类名或者实例 来创建或者设置`
  
```
    ------------------- UIView+Extension -------------------
    
    //MARK: ----- 创建

    ///初始化View 设置背景颜色
    class func lgl_view(_ backgroundColor: UIColor) -> Self
    
    ///初始化View 设置背景颜色、圆角
    class func lgl_view(_ backgroundColor: UIColor, _ cornerRadius: CGFloat) -> Self
    
    //MARK: ----- 设置
    
    ///设置View 背景颜色、圆角
    func lgl_view(_ backgroundColor: UIColor, _ cornerRadius: CGFloat)
    
    //MARK: ----- 给view添加 渐变 阴影  切角 阴影和边框 获取当前View的控制器 View转image
    
    /// 水平渐变
    func lgl_horizontalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat)
    
    /// 垂直渐变
    func lgl_verticalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat)
    
    /// 设置view的切角
    func lgl_roundingCorner(_ corners: UIRectCorner, _ radii: CGFloat)
    
    ///给View添加阴影
    func lgl_shadow( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat)
    
    ///给View添加阴影和边框
    func lgl_shadowBorder( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat, _ borderColor: UIColor)
    
    ///获取当前View的控制器
    func lgl_viewGetcurrentVC() -> UIViewController?
    
    ///view转图片
    func lgl_viewToImage() -> UIImage
```
  
```
    ------------------- UIImageView+Extension -------------------
    
     //MARK: ----- 创建
     
    ///设置图片初始化
    class func lgl_imagView(_ imageName:String) -> Self
    ///设置图片和圆角初始化
    
    class func lgl_imagView(_ imageName:String, _ cornerRadius:CGFloat) -> Self
    ///设置图片和圆角、背景色初始化
    
    class func lgl_imagView(_ imageName:String, _ backgroundColor: UIColor, _ cornerRadius:CGFloat) -> Self
    
    //MARK: ----- 设置
    
    ///设置图片
    func lgl_imagView(_ imageName:String)
    
    ///设置图片和圆角
    func lgl_imagView(_ imageName:String, _ cornerRadius:CGFloat)
    
    ///设置图片和圆角、背景色
    func lgl_imagView(_ imageName:String, _ backgroundColor: UIColor,  _ cornerRadius:CGFloat)
```
```
   ------------------- UILabel+Extension -------------------
   
    //MARK: ----- 创建
   
   ///初始化label 字体、字体颜色 背景颜色、 字体大小、对齐方式、行数
   class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int) -> Self
   
   ///初始化label 字体、字体颜色 字体大小、对齐方式
   class func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) -> Self
   
   ///初始化label 字体、字体颜色 字体大小、行数
   class func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ numberOfLines: Int) -> Self
   
   ///初始化label 字体、字体颜色 字体大小
   class func lgl_label(_ text: String, _ textColor: UIColor,  _ font: UIFont) -> Self
   
   ///初始化label 字体、字体颜色、背景颜色、 字体大小、对齐方式
   class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment) -> Self
   
   ///初始化label 字体、字体颜色、背景颜色、 字体大小行数
   class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ numberOfLines: Int) -> Self
   
   ///初始化label 字体、字体颜色、背景颜色、 字体大小
   class func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont) -> Self
   
   //MARK: ----- 设置
   
   ///设置label 字体、字体颜色、背景颜色、 字体大小、对齐方式、行数
   func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int)
   
   ///设置label 字体、字体颜色、背景颜色、 字体大小、对齐方式
   func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment)
   
   ///设置label 字体、字体颜色、背景颜色、 字体大小、行数
   func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ numberOfLines: Int)
   
   ///设置label 字体、字体颜色、背景颜色、 字体大小
   func lgl_label(_ text: String, _ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont)
   
   ///设置label 字体、字体颜色、背景颜色、 字体大小、对齐方式、行数
   func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment)
   
   ///设置label 字体、字体颜色、 字体大小、行数
   func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ numberOfLines: Int)
   
   ///设置label 字体、字体颜色、 字体大小
   func lgl_label(_ text: String, _ textColor: UIColor, _ font: UIFont)
   
   ///设置label 切圆角
   func lgl_labelRadius(_ cornerRadius: CGFloat)
   
   ///设置label 边框和边框颜色
   func lgl_labelBorder(_ borderColor: UIColor, _ borderWidth: CGFloat)
   
   ///设置label 边框、边框颜色、切圆角
   func lgl_labelBorder(_ borderColor: UIColor, _ borderWidth: CGFloat, _ cornerRadius: CGFloat)

```
```
    ------------------- UIButton+Extension -------------------

    //MARK: ----- 创建
 
     ////初始化button  设置 标题文字、文字颜色、文字大小
     class func lgl_button(_ title:String, _ titleColor:UIColor, _ backgroundColor: UIColor, _ font:UIFont, _ target:Any, _ action:Selector) -> Self
     
     ////初始化button  设置 标题文字、文字颜色、文字大小
     class func lgl_button(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ target:Any, _ action:Selector) -> Self
     
     ////初始化button  设置 标题文字、文字颜色、文字大小、图片
     class func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont, _ target:Any, _ action:Selector) -> Self
     
     ////初始化button  设置 标题文字、文字颜色、文字大小、背景图片
     class func lgl_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) -> Self
     
     ////初始化button 没有点击  设置 标题文字、文字颜色、文字大小、图片
     class func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont) -> Self
     
     ////初始化button  设置 标题文字、文字颜色、文字大小、选中和未选中图片
     class func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String,  _ selectedImageName: String,  _ font:UIFont, _ target:Any, _ action:Selector) -> Self
     
     ////初始化button  设置 标题文字、文字颜色、文字大小、选中和未选中背景图片
     class func lgl_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ selectedBackgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) -> Self
     
     //MARK: ---- 设置
     
     ////设置button 标题文字、文字颜色、文字大小
     func lgl_button(_ title:String, _ titleColor:UIColor, _ backgroundColor: UIColor, _ font:UIFont, _ target:Any, _ action:Selector)
     
     ////设置button 标题文字、文字颜色、文字大小
     func lgl_button(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ target:Any, _ action:Selector)
     
     ////设置button 标题文字、文字颜色、文字大小、图片
     func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont, _ target:Any, _ action:Selector)
     
     ////设置button 标题文字、文字颜色、文字大小、背景图片
     func lgl_button(_ title:String, _ titleColor: UIColor, _ backgroundImage:UIImage, _ font:UIFont, _ target:Any, _ action:Selector) 
     
     ////设置button 没有点击 标题文字、文字颜色、文字大小、图片
     func lgl_button(_ title:String, _ titleColor:UIColor, _ imageName: String, _ font:UIFont)
     
     ///设置图片
     func lgl_buttonImage(_ normalImageName: String, _ selectImageName: String)
     
     ///设置背景图片
     func lgl_buttonBackgroundImage(_ normalImageName: String, _ selectImageName: String)
     
     ///设置圆角
     func lgl_buttonRadius(_ cornerRadius: CGFloat)
     
     ///设置边框颜色、边框宽度
     func lgl_buttonBorder(_ borderColor: UIColor, _ borderWidth: CGFloat)
     
     ///设置边框颜色、边框宽度、圆角
     func lgl_buttonBorder(_ borderColor: UIColor, _ borderWidth: CGFloat, _ cornerRadius: CGFloat)
```
```
    ------------------- UITextField+Extension -------------------
    
    //MARK: ----- 创建
    
    ///初始化TextField  字体大小、字体颜色、提示文字、边框样式 、背景色
    class func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Self
    
    ///初始化TextField 字体大小、字体颜色、提示文字、边框样式
    class func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Self
    
    ///初始化TextField 字体大小、字体颜色、提示文字
    class func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String) -> Self 
    
    ///初始化TextField 字体大小、字体颜色
    class func lgl_textField(_ textColor: UIColor, _ font: UIFont) -> Self
    
    //MARK: ---- 设置
    
    ///设置TextField 字体大小、字体颜色、提示文字、边框样式、背景色
    func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle)
    
    ///设置TextField 字体大小、字体颜色、提示文字、背景色
    func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String)
    
    ///设置TextField 字体大小、字体颜色、背景色
    func lgl_textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont)
    
    ///设置TextField 字体大小、字体颜色、提示文字、边框样式
    func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle)
    
    ///设置TextField 字体大小、字体颜色、提示文字
    func lgl_textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String) 
    
    ///设置TextField 字体大小、字体颜色
    func lgl_textField(_ textColor: UIColor, _ font: UIFont)
    
    ///设置Placeholder的字体大小和颜色
    func lgl_textFieldPlaceholder(_ color: UIColor, _ font: UIFont)
    
    ///设置LeftView
    func lgl_textFieldSetLeftView(_ leftView: UIView?)
    
    ///设置RightView
    func lgl_textFieldSetRightView(_ rightView: UIView?)
    
    ///修改clear按钮的图片
    func lgl_textFieldChangeClearButton(_ imageName: String)
    
    ///切圆角
    func lgl_textFieldCornerRadius(_ cornerRadius: CGFloat)

```
  ` 2. 颜色`
```
    ///设置颜色
    convenience init(_ hex: UInt) {
    class func lgl_color(_ hex: String) -> UIColor
    
    ///使用举例
    UIColor(0xefefef)
    UIColor.lgl_color("#efefef") -> UIColor
    
    ///适配暗黑模式设置颜色 dark -- 暗黑模式下的颜色   light -- 其他模式下的颜色
    UIColor.lgl_traitColor(darkColor, lightColor) -> UIColor
    UIColor.lgl_traitColor(lightColor) -> UIColor
```
     
  `3. 字符串`
  
  /// --- 基于NSRegularExpression判断 --
  
  | 方法 | 返回值类型 | 说明 |
  | --- | --- | --- |
  | lgl_isMatch(regularString: String) | Bool  | 字符串参数（自定义正则判断） |
  | lgl_isMatch(regularString: XLRegularString) | Bool  | 枚举值参数（自定义正则判断） |
  | lgl_isPhoneNumber()| Bool | 判断手机号 
  | lgl_isTelePhoneNumber() | Bool | 判断固定电话|
  | lgl_isVericationCode() | Bool | 验证码格式|
  | lgl_isEmail() | Bool | 判断邮箱|
  | lgl_isUsername() | Bool | 判断用户名 |
  | lgl_isPassword()| Bool | 判断密码| 
  | lgl_isPostalCode()| Bool | 判断邮政编码 | 
  | lgl_isIDCardNumber()| Bool | 判断身份证号 |
  | lgl_hasNumber()| Bool | 是否包含数字的字符串|
  | lgl_allNumber()| Bool | 是否纯数字字符串 |
  | lgl_hasLowerCase()| Bool | 是否包含小写字母的字符串 |
  | lgl_allLowerCase()| Bool | 是否纯小写字母字符串 |
  | lgl_hasUpperCase()| Bool | 是否包含大写字母的字符串 |
  | lgl_allUpperCase()| Bool | 是否纯大写字母字符串 |
  | lgl_hasLetter()| Bool | 是否包含字母的字符串|
  | lgl_allLetter()| Bool | 是否纯字母字符串 |
  | lgl_hasNumberOrLetter()| Bool | 是否包含数字或字母的字符串 |
  | lgl_bothNumberAndLetter()| Bool | 是否同时包含数字和密码的字符串 |
  | lgl_hasEmoji()| Bool | 是否包含表情符|
  | lgl_hasChinese()| Bool | 是否包含中文字符|

```
// MARK: ---------------  NSAttributedString
  
  ///获取某一段文字的CGSize
  func lgl_getStrSize(_ font: UIFont, _ maxWidth: CGFloat) -> CGSize
  
  ///修改指定文字的字体大小 和 颜色
  func lgl_modifyRangeText(_ changeText: String, _ changeColor: UIColor, _ changeFont: UIFont) -> NSAttributedString
  
  ///设置行间距
  func lgl_modifyLineHeight(_ lineHeight: CGFloat, _ alignment: NSTextAlignment) -> NSAttributedString
  
  ///设置指定范围内文字的颜色
  func lgl_modifyRangeTextColor(_ range: NSRange, _ changeColor: UIColor) -> NSAttributedString
  
  ///设置指定范围内文字的下划线 颜色
  func lgl_modifyRangeUnderLine( _ range: NSRange, _ rangeColor: UIColor, _ lineColor:UIColor)  -> NSAttributedString
  
  ///设置行间距 和 首行缩进缩进两个字符
  func lgl_setHeadIndent(_ lineHeight: CGFloat, _ font: UIFont) -> NSAttributedString
  ///设置一条文字中间的线
  func lgl_setThroughLine(_ range: NSRange, _ lineColor: UIColor) -> NSAttributedString
  
  ///获取设置行高以后的字符串的Size(高)
  func lgl_getLineHeightSize(_ lineHeight: CGFloat, _ font: UIFont, _ maxW: CGFloat) -> CGSize
```

` 4. NSRegularExpression+Extension`

```
    ///匹配 
    class func lgl_isMatch(string: String, pattern: String) -> Bool
    class func lgl_isMatch(string: String, pattern: String, ignoreCase: Bool) -> Bool
    
    ///替换
    class func lgl_replacement(string: String, replace: String, pattern: String) -> String
```


####  四、一些常见的方法包含在类 `LGLMethod`（会持续补充方法）

```
    //MARK: ----  方法 ---- 
    
    ///返回原始图片
    public class func originalImage(_ imageName: String) -> UIImage?

    ///等比缩放图片获取高度
    public class func imageHeight(_ imageW: CGFloat, _ imageH: CGFloat, _ realW: CGFloat) -> CGFloat

    ///根据root控制器，返回当前控制器
    public class func currentVC() -> UIViewController?
    
    //MARK: ----  使用 ---- 
 
    ///返回原始图片
    LGLMethod.originalImage(_ imageName: String) -> UIImage?

    ///等比缩放图片获取高度
    LGLMethod.imageHeight(_ imageW: CGFloat, _ imageH: CGFloat, _ realW: CGFloat) -> CGFloat 

    ///根据root控制器，返回当前控制器
    LGLMethod.currentVC() -> UIViewController? 
    
    ///根据颜色生成图片（UIImage）
    LGLMethod.imageWithColor(_ color: UIColor, _ size: CGSize) -> UIImage
    
    ///打开链接  OpenUrl
    @discardableResult
    LGLMethod.openUrl(_ url: URL) -> Bool
    
    ///拨打电话
    LGLMethod.lgl_callPhone(_ number: String)
    
    /// 跳转appStore 评论
    LGLMethod.lgl_appStoreComment(_ appId: String)
```

####  四、LGLAlert系统的提示弹框

    ```
    ///aler提示框
    LGLAlert.lgl_alert(_ title: String, _ message: String, _ showTime: TimeInterval = 1.0)
    
    ///单个按钮的alert提示框
     LGLAlert.lgl_alert(_ title: String, _ message: String, _ actionTitle:String, _ actionStyle:UIAlertAction.Style = .default, handler:((UIAlertAction) -> Void)? = nil)
    
    ///两个按钮的alert提示框
     LGLAlert.lgl_alert(_ title: String, _ message: String, _ cancelTitle:String, cancelHandler:((UIAlertAction) -> Void)? = nil, _ confirmTitle:String, confirmHandler:((UIAlertAction) -> Void)? = nil)
    
    ///ationSheet 提示框
     LGLAlert.lgl_ationSheet(_ title: String, _ message: String, _ showTime: TimeInterval = 1.0)
    
    ///单个按钮的ationSheet提示框
     LGLAlert.lgl_ationSheet(_ title: String, _ message: String, _ actionTitle:String, _ actionStyle:UIAlertAction.Style = .default, handler:((UIAlertAction) -> Void)? = nil)
    
    ///两个按钮的ationSheet提示框
     LGLAlert.lgl_ationSheet(_ title: String, _ message: String, _ cancelTitle:String, cancelHandler:((UIAlertAction) -> Void)? = nil, _ confirmTitle:String, confirmHandler:((UIAlertAction) -> Void)? = nil)
     
     ///一个按钮的filed弹窗
     LGLAlert.lgl_field(_ title: String, _ message: String, _ buttonTitle: String, _ fieldHolder:String = "", handler:@escaping ((_ filedValue: String?) -> Void))
     
     ///两个按钮的filed弹窗
     LGLAlert.lgl_field(_ title: String, _ message: String,_ cancelTitle:String,_ fieldHolder:String = "", cancelHandler:((UIAlertAction) -> Void)? = nil,  _ buttonTitle: String,  confirmHandler:@escaping ((_ filedValue: String?) -> Void))
    
    ```


#### 五、LGLCrypt加密工具

        包含 Md5加密，AESAES（128+CBC+PKCS7Padding），RSA加解密、加签和验签
        
    ```
         --------- Md5 --------------
         
         LGLCrypt.lgl_md5Encrypt(_ text: String ) -> String
         
         --------- AES --------------
         
         ///AES加密（[UInt8]c形式的key和iv）
         LGLCrypt.lgl_aesEncrypt(_ text: String, _ key:[UInt8], _ iv:[UInt8]) -> String?
         
         ///AES解密([UInt8]c形式的key和iv)
         LGLCrypt.lgl_aesDecrypt(_ aesText: String, _ key:[UInt8], _ iv:[UInt8]) -> String?
         
         ///AES加密(字符串形式的key和iv)
         LGLCrypt.lgl_aesEncryptStr(_ text: String, _ key:String, _ iv:String) -> String?
         
         ///AES解密(字符串形式的key和iv)
         LGLCrypt.lgl_aesDecryptStr(_ aesText: String, _ key:String, _ iv:String) -> String?
         
         --------- RSA --------------
          
        ///  RSA签名
         LGLCrypt.lgl_rsaSignWithSHA1(_ text: String, _ privateKey: String, _ privateKeychainTag:String = LGL_RSA_PRIVATE_KEY) -> String?
         
         
         /// RSA验签
         LGLCrypt.lgl_rsaSignVerifyWithSHA1(_ originalStr: String, _ siginStr: String, _ publicKey: String, _ privateKeychainTag:String = LGL_RSA_PRIVATE_KEY) -> Bool
         
         /// RSA公钥加密
         LGLCrypt.lgl_rsaEncrypt(_ text: String, _ publicKey: String, _ publicKeychainTag:String = LGL_RSA_PUBLIC_KEY) -> String?
         
         /// RSA私钥解密
         LGLCrypt.lgl_rsaDecrypt(_ encryptData: String, _ privateKey: String, _ privateKeychainTag:String = LGL_RSA_PRIVATE_KEY) -> String?
         
         /// RSA公钥解密
         LGLCrypt.lgl_rsaDecryptPublic(_ encryptData: String, _ publicKey: String, _ publicKeychainTag:String = LGL_RSA_PUBLIC_KEY) -> String?
    ```

## Author

liguoliang, yuanxinliang

欢迎加群 ： 457236811 提供建议和交流

## Contributors

  wait for you ...

 
## License

LGLBaseKit is available under the MIT license. See the LICENSE file for more info.
