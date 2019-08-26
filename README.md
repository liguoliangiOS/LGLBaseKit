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

```ruby
pod 'LGLBaseKit'
```

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
    UIColor.lgl_color("#efefef")
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
```


## Author

liguoliang, yuanxinliang

欢迎加群 ： 457236811 提供建议和交流

## Contributors

  wait for you ...

 
## License

LGLBaseKit is available under the MIT license. See the LICENSE file for more info.
