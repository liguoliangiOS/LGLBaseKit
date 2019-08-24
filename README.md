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

```
 1. UI控件，使用的时候都使用 类名或者实例 来创建或者设置
  例如： UIImageView的使用（其他的请具体查看代码）
    //类创建
    let imageview = UIImageView.lgl_imagView("图片名称") 
    
    //类实例设置
    let imageV =  UIImageView()
    imageV.lgl_imagView("图片名称") 
    
    
  
  2. 颜色
     UIColor(0xefefef)
     UIColor.lgl_color("#efefef")
     
  3. 字符串
   判断手机号 let res:Bool = "15100000000".lgl_isPhoneNumber   
   
```

####  四、一些常见的方法包含在类 `LGLMethod`（会持续补充方法）

```
 例如：
 
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

## License

LGLBaseKit is available under the MIT license. See the LICENSE file for more info.
