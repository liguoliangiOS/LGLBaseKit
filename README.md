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

## 0.1.2版本更新

#### 补充判断设备的Model（iPhone 11 Pro， iPhone XS Max .......）
#### 新增一些实用的方法，请查看具体代码

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

  ####  `1. UI控件，使用的时候都使用 类名或者实例 来创建或者设置,更多方法请查阅具体view的扩展方法`
  

`UIView+Extension`
    
```
    ///初始化View 设置背景颜色
    let view =  UIView.lgl_view(.red)
```

```
    ///初始化View 设置背景颜色、圆角
    let view2 = UIView()
    view2.lgl_view(.red, 20)
```

```
    /// 水平渐变
    let view3 = UIView()
    view3.lgl_horizontalGradientLayer(.red, .red, 20)
```

```
    /// 垂直渐变
    view3.lgl_verticalGradientLayer(.red, .red, 20)
```

```
    /// 设置view的切角 
    view3.lgl_roundingCorner([.topLeft, .topRight], _ radii: 5)
```

```
    ///给View添加阴影
    view3.lgl_shadow(.red, CGSize(width:0, height:3), 0.2, 10, 8)
```

```
    ///给View添加阴影和边框
    view3.lgl_shadowBorder(.red, CGSize(width:0, height:3), 0.2, 10, 8, .gray)
```

```
    ///获取当前View的控制器
    let currentVC =  view3.lgl_viewGetcurrentVC()
```

```
    ///view转图片
    let image =  view3.lgl_viewToImage()
```
  
`UIImageView+Extension`

```    
    ///设置图片初始化
    let imageV =  UIImageView.lgl_imagView("图片名字.png")
```

```
    ///设置图片
    let imageV = UIImageView()
    imageV.lgl_imagView("图片名字.png")
```


`UILabel+Extension`

```
   ///初始化label 字体、字体颜色  字体大小、对齐方式、行数
   let label = UILabel.lgl_label("文字", .red,  UIFont.systemFont(ofSize: 14), .left, 0)
```

```
    ///设置label 字体、字体颜色、背景颜色、 字体大小、对齐方式、行数
   let label = UILabel()
   label.lgl_label("文字", .red, .white, UIFont.systemFont(ofSize: 14),.left, 0)
```  

```
   ///设置label 切圆角
   let label = UILabel()
   label.lgl_labelRadius(12)
```
```
   ///设置label 边框和边框颜色
   let label = UILabel()
   label.lgl_labelBorder(.red, 1)
```

```
   ///设置label 边框、边框颜色、切圆角
   let label = UILabel()
   label.lgl_labelBorder(.red, 1, 10)

```

`UIButton+Extension`

```
    ////初始化button  设置 标题文字、文字颜色、文字大小
    let btn = UIButton.lgl_button("标题", .red, UIFont.systemFont(ofSize: 14), self, #selector(selectBtn)) 
```

```
     ////设置button 标题文字、文字颜色、文字大小
     let btn = UIButton(type: .custom)
     btn.lgl_button("标题", .red, UIFont.systemFont(ofSize: 14), self, #selector(selectBtn)) 
```
```
     ///设置图片
     let btn = UIButton(type: .custom)
     btn.lgl_buttonImage("normal_image_name.png", "select_image_name.png")
```
```
     ///设置背景图片
     let btn = UIButton(type: .custom)
     btn.lgl_buttonBackgroundImage("normal_back_image_name.png", "select_back_image_name.png")
```
```
     ///设置圆角
     let btn = UIButton(type: .custom)
     btn.lgl_buttonRadius(10)
```

```
     ///设置边框颜色、边框宽度
     let btn = UIButton(type: .custom)
     btn.lgl_buttonBorder(.red, 1)
```

```
     ///设置边框颜色、边框宽度、圆角
     let btn = UIButton(type: .custom)
     btn.lgl_buttonBorder(.red, 1, 10)
```


`UITextField+Extension`

```
    ///初始化TextField 字体颜色、 字体大小、提示文字、边框样式
    let field = UITextField.lgl_textField(.red, UIFont.systemFont(ofSize: 14), "提示文字", .none)
```

```
    ///设置TextField 字体大小、字体颜色、提示文字、边框样式
    let field = UITextField()
    field.lgl_textField(.red, UIFont.systemFont(ofSize: 14), "提示文字", _ borderStyle: .none)
```

```
    ///设置Placeholder的字体大小和颜色
    let field = UITextField()
    field.lgl_textFieldPlaceholder(.red, UIFont.systemFont(ofSize: 14))
```

```
    ///设置LeftView
    let field = UITextField()
    let leftView = UIView()
    field.lgl_textFieldSetLeftView(leftView)
```

```
    ///设置RightView
    let field = UITextField()
    let rightView = UIView()
    field.lgl_textFieldSetRightView(rightView)
```

```
    ///修改clear按钮的图片
    let field = UITextField()
    field.lgl_textFieldChangeClearButton("clear_btn_image.png")
```

```
    ///切圆角
    let field = UITextField()
    field.lgl_textFieldCornerRadius(10)
```

`UIImage+Extension`

```
    /**图片拉伸 指定
        edgeInset 指定不被拉伸的区域
        imageName 图片名称
        resizeMode UIImageResizingModeTile,//进行区域复制模式拉伸 【-】 -> 【-】【-】【-】
        resizeMode UIImageResizingModeStretch,//进行渐变复制模式拉伸 连续的 【-】 -> 【-----】
    */
    let image = UIImage(named:"image.png")
    ///设置要保留的部分
    let uiedgeSet = UIEdgeInsets(top: 11, left:0, bottom: 11, right: 0)
    let resizeMode =  .stretch
    
    let strechImage = image.lgl_stretchImage(uiedgeSet, resizeMode) 
}

```

  ` 2. 颜色`
  
```
    ///设置颜色
    let color = UIColor(0xefefef)
    let color = UIColor.lgl_color("#efefef") -> UIColor
```

```
    ///适配暗黑模式设置颜色 dark -- 暗黑模式下的颜色   light -- 其他模式下的颜色
    ///darkColor   lightColor
    let color = UIColor.lgl_traitColor(.white, black) 
    let color = UIColor.lgl_traitColor(.white)
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


`NSAttributedString`

```
  ///获取某一段文字的CGSize
  let str = "这是要获取字符串size的文字"
  let font =  UIFont.systemFont(ofSize: 14)
  let maxWidth = 100
  let size = str.lgl_getStrSize(font, maxWidth) 
```

```
  
  ///修改指定文字的字体大小 和 颜色
  let str = "这是要获取字符串size的文字"
  let changeText = "获取字符"
  let attributestr = str.lgl_modifyRangeText(changeText, .red, font)
  
```
```
  ///设置行间距
  let lineHeight = 5
  let alignment = .center
  let attributestr = str.lgl_modifyLineHeight(lineHeight, alignment) 
```

```
  ///设置指定范围内文字的颜色
  let range = NSRange(location:1, length: 3)
  let attributestr = str.lgl_modifyRangeTextColor(range, .red) 
```

```
  
  ///设置指定范围内文字的下划线 颜色
  let range = NSRange(location:1, length: 3)
  let rangeColor = .red
  let lineColor = .red
  let attributestr = str.lgl_modifyRangeUnderLine( range, rangeColor, lineColor)
```

```
  ///设置行间距 和 首行缩进缩进两个字符
   let lineHeight = 5
   let font =  UIFont.systemFont(ofSize: 14)
   let attributestr = str.lgl_setHeadIndent(lineHeight, font) 
```

```
  ///设置一条文字中间的线
  let range = NSRange(location:1, length: 3)
  let lineColor = .red
  let attributestr = str.lgl_setThroughLine(range, lineColor) 
```

```
  ///获取设置行高以后的字符串的Size(高)
  let lineHeight = 5
  let font =  UIFont.systemFont(ofSize: 14)
  let maxW = 100
  let size = str.lgl_getLineHeightSize(lineHeight, font, maxW)
```

`4. NSRegularExpression+Extension`


 `匹配`

```
    ///匹配 
    let res:Bool = NSRegularExpression.lgl_isMatch(string: "判断的字符串", pattern: "正则字符串")   
```
`替换`

```
    let str = NSRegularExpression.lgl_replacement(string: "判断的字符串", replace: "要替换的字符串", pattern: "正则字符串") 
```


####  四、一些常见的方法包含在类 `LGLMethod`（会持续补充方法）

`这里只列举几个，更多的请查看具体的LGLMethod里面`

```
    ///返回原始图片
    let oriImage = LGLMethod.originalImage("image_name.png") 
```

```
    ///等比缩放图片获取高度 imageW imageH realW具体使用时候的宽度
    let H = LGLMethod.imageHeight(750, 300, 600) 
```

```
    ///根据root控制器，返回当前控制器
    let currentVC = LGLMethod.currentVC()
```

```
    ///根据颜色生成图片（UIImage）
    let image = LGLMethod.imageWithColor(.red, CGSize(width:100, height:100))
```

```
    ///打开链接  OpenUrl
    @discardableResult
    LGLMethod.openUrl(url) 
```

```
    ///拨打电话
    LGLMethod.lgl_callPhone(number)
```

```
    /// 跳转appStore 评论
    LGLMethod.lgl_appStoreComment(appId)
```

####  四、`LGLAlert`系统的提示弹框

```
    ///aler提示框 标题 内容 展示时间（默认1s）
    LGLAlert.lgl_alert("提示", "提示内容", 2)
```

```
    ///ationSheet 提示框 标题 内容 展示时间（默认1s）
    LGLAlert.lgl_ationSheet("提示", "提示内容", 2)
```

```
     ///一个按钮的filed弹窗 标题 内容 按钮标题 提示文字
     LGLAlert.lgl_field("提示", "提示内容", "确定", "提示文字", handler:{(filedValue) in
        print(filedValue)
     })
```

#### 五、`LGLCrypt`加密工具


`包含 Md5加密，AESAES（128+CBC+PKCS7Padding），RSA加解密、加签和验签`
      
`Md5`

```
    let md5Str = LGLCrypt.lgl_md5Encrypt("要加密的字符串")
```

`AES加解密`

```
     ///AES加密（[UInt8]c形式的key和iv）
     let key:[UInt8] //[UInt8]类型的key
     let iv: [UInt8] //[UInt8]类型的iv
     let aesEcrypt = LGLCrypt.lgl_aesEncrypt("要加密的字符串", key, iv)
     
     ///AES解密([UInt8]c形式的key和iv)
     let aesDecrypt = LGLCrypt.lgl_aesDecrypt("要解密的字符串", key, iv)
```

```
     ///AES加密(字符串形式的key和iv)
     let key = "" 
     let iv= "" 
     let aesEcrypt = LGLCrypt.lgl_aesEncryptStr("要加密的字符串",key, iv)
     
     ///AES解密(字符串形式的key和iv)
     let aesDecrypt = LGLCrypt.lgl_aesDecryptStr("要解密的字符串", key, iv)
```

`RSA加解密、加签和验签`

```
     ///  RSA签名
     let  privateKey = ""
     let  privateKeychainTag = ""
     let signStr = LGLCrypt.lgl_rsaSignWithSHA1("要签名字符串", privateKey, privateKeychainTag)
     
     /// RSA验签
     let  publicKey = ""
     //Bool
     let res = LGLCrypt.lgl_rsaSignVerifyWithSHA1("原始字符串", "签名的字符串", publicKey, privateKeychainTag) 
```

```
    let  publicKey = ""
    let  privateKeychainTag = ""
     /// RSA公钥加密
    let encryptStr = LGLCrypt.lgl_rsaEncrypt("要加密的字符串", publicKey,publicKeychainTag) 
     
     /// RSA私钥解密
    let  privateKey = ""
    let decryptStr = LGLCrypt.lgl_rsaDecrypt("要解密的字符串", privateKey, privateKeychainTag:String)
     
     /// RSA公钥解密
     let decryptStr = LGLCrypt.lgl_rsaDecryptPublic("要解密的字符串", publicKey, publicKeychainTag)
```

## Author

liguoliang, yuanxinliang

欢迎加群 ： 457236811 提供建议和交流

## Contributors

  wait for you ...

 
## License

LGLBaseKit is available under the MIT license. See the LICENSE file for more info.
