//
//  String+Extension.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/8/21.
//

import UIKit

public enum XLRegularString: String {
    /// 手机号格式 - 只允许数字，示例：13512345678
    case phoneNumber = "^(1)(\\d{10})$"
    
    /// 固定电话格式 - 只允许数字，示例：075511223344 或 02011223344
    case telephoneNumber = "^(0)(\\d{2,3})(\\d{7,8})$"
    
    /// 验证码格式 - 只允许数字，示例：1234 或 123456 （4位或6位的验证码）
    case verificationCode = "^(\\d{4}|\\d{6})$"
    
    /// 邮箱格式 - 只允许英文字母、数字、下划线、英文句号、以及中划线组成 y-30@qq.com
    case email = "^([\\w-]+)(@)([A-Za-z\\d]+)(\\.)([A-Za-z\\d]+)$"
    
    /// 用户名格式 - 只允许使用字母、数字、下滑线、横杠，3~20位
    case username = "^[\\w-]{3,20}$"
    
    /// 密码格式 - 0.字母和数字组合的字符串 1.至少包含一个字母；2.至少包含一个数字；3，长度为6~20位
    //    case password = "^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{6,20}$"
    case password = "^(?=.*[\\d]+)(?=.*[A-Za-z]+)([A-Za-z\\d]{6,20})$"
    
    /// 邮政编码格式 - 必须由6位数字组成
    case postalCode = "^\\d{6}$"
    
    /// 身份证号格式 - 15位或18位的身份证号
    case idCardNumber = "^(\\d{14}|\\d{17})([\\dxX])$"
    
    /// 数字 - 包含数字
    case hasNumber = "[\\d]+"
    
    /// 数字 - 只包含数字
    case allNumber = "^[\\d]+$"
    
    /// 小写字母 - 包含小写字母
    case hasLowerCase = "[a-z]+"
    
    /// 小写字母 - 只包含小写字母
    case allLowerCase = "^[a-z]+$"
    
    /// 大写字母 - 包含大写字母
    case hasUpperCase = "[A-Z]+"
    
    /// 大写字母 - 只包含大写字母
    case allUpperCase = "^[A-Z]+$"
    
    /// 字母 - 包含字母
    case hasLetter = "[A-Za-z]+"
    
    /// 字母 - 只包含字母
    case allLetter = "^[A-Za-z]+$"
    
    /// 数字和字母 - 包含数字或字母
    case hasNumberLetter = "[A-Za-z\\d]+"
    
    /// 数字和字母 - 同时包含数字和密码
    case bothNumberLetter = "^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{2,}$"
    
    /// 表情符 - 包含表情符
    case hasEmoji = "[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]+"
    
    /// 表情符 - 只包含表情符
    case allEmoji = "^[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]+$"
    
    /// 中文 - 包含中文
    case hasChinese = "[\\u4E00-\\u9FA5]+"
    /// 中文 - 只包含中文
    case allChinese = "^[\\u4E00-\\u9FA5]+$"
    
    /// 限制输入： 只允许输入数字、字母、中文字符、九宫格输入法(➋➌➍➎➏➐➑➒)、·•、限制 1-30，应用场景：用户名
    case limitInput1 = "^[·•➋➌➍➎➏➐➑➒A-Za-z0-9\\u4E00-\\u9FA5]{1,30}$"
    
    /// 限制输入： 只允许输入 0-9和xX的字符，应用场景：身份证号
    case limitInput2 = "^[0-9xX]+$"
}

public extension String {
    ///限制只能输入数字格式
    var lgl_limitNumber: Bool {
        let str = "0123456789\n"
        return lgl_basekit_judgeCharacterSetWithStr(str, self)
    }
    
    ///限制只能输入邮箱格式
    var lgl_limitEmial: Bool {
        let str = "[a-zA-Z0-9@.]*"
           return lgl_basekit_judgeCharacterSetWithStr(str, self)
    }
    
    ///限制固定电话输入格式
    var lgl_limitTelephone: Bool {
        let str = "^(0[0-9]{2,3})?([2-9][0-9]{6,7})"
        return lgl_basekit_judgeCharacterSetWithStr(str, self)
    }
    
    ///限制输入数字、字母、中文字符格式
    var lgl_limitOutSpecial:  Bool {
        let str = "[a-zA-Z0-9\\u4E00-\\u9FA5]+"
        return lgl_basekit_judgeCharacterSetWithStr(str, self)
    }
    
    ///限制输入姓名格式为 中文数字英文和·• maxLimit最大位数
   func lgl_limitChineseName(_ maxLimit: Int) -> Bool {
       if self.count == 0 {
           return true
       }
       let regextestStr: String = "[·•➋➌➍➎➏➐➑➒a-zA-Z0-9\\u4e00-\\u9fa5]{0,\(maxLimit)}"
       return lgl_basekit_judgeCharacterSetWithStr(regextestStr, self)
   }
    ///限制身份证能输入的格式
    var lgl_limitIdCarNumber:  Bool {
        return lgl_basekit_judgeCharacterSetWithStr("0123456789xX", self)
    }
    /////限制能输入大小写字母和数字的格式
    var lgl_limitLetterNumber: Bool {
        let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        return lgl_basekit_judgeCharacterSetWithStr(str, self)
    }
}

public extension String {
    
    /// 字符串参数
    func lgl_isMatch(regularString: String) -> Bool {
        return NSRegularExpression.lgl_isMatch(string: self, pattern: regularString)
    }
    
    // 枚举值参数
    func lgl_isMatch(regularString: XLRegularString) -> Bool {
        return NSRegularExpression.lgl_isMatch(string: self, pattern: regularString.rawValue)
    }
    
    /// 判断手机号
    func lgl_isPhoneNumber() -> Bool {
        return lgl_isMatch(regularString: .phoneNumber)
    }
    
    /// 判断固定电话
    func lgl_isTelePhoneNumber() -> Bool {
        return lgl_isMatch(regularString: .telephoneNumber)
    }
    
    /// 是否匹配验证码格式
    func lgl_isVericationCode() -> Bool {
        return lgl_isMatch(regularString: .verificationCode)
    }
    
    /// 判断是否匹配邮箱格式
    func lgl_isEmail() -> Bool {
        return lgl_isMatch(regularString: .email)
    }
    
    /// 判断用户名
    func lgl_isUsername() -> Bool {
        return lgl_isMatch(regularString: .username)
    }
    
    /// 判断密码
    func lgl_isPassword() -> Bool {
        return lgl_isMatch(regularString: .password)
    }
    
    /// 判断邮政编码
    func lgl_isPostalCode() -> Bool {
        return lgl_isMatch(regularString: .postalCode)
    }
    
    /// 判断身份证号
    func lgl_isIDCardNumber() -> Bool {
        return lgl_isMatch(regularString: .idCardNumber)
    }
    
    /// 是否包含数字的字符串
    func lgl_hasNumber() -> Bool {
        return lgl_isMatch(regularString: .hasNumber)
    }
    
    /// 是否纯数字字符串
    func lgl_allNumber() -> Bool {
        return lgl_isMatch(regularString: .allNumber)
    }
    
    /// 是否包含小写字母的字符串
    func lgl_hasLowerCase() -> Bool {
        return lgl_isMatch(regularString: .hasLowerCase)
    }
    
    /// 是否纯小写字母字符串
    func lgl_allLowerCase() -> Bool {
        return lgl_isMatch(regularString: .allLowerCase)
    }
    
    /// 是否包含大写字母的字符串
    func lgl_hasUpperCase() -> Bool {
        return lgl_isMatch(regularString: .hasUpperCase)
    }
    
    /// 是否纯大写字母字符串
    func lgl_allUpperCase() -> Bool {
        return lgl_isMatch(regularString: .allUpperCase)
    }
    
    /// 是否包含字母的字符串
    func lgl_hasLetter() -> Bool {
        return lgl_isMatch(regularString: .hasLetter)
    }
    
    /// 是否纯字母字符串
    func lgl_allLetter() -> Bool {
        return lgl_isMatch(regularString: .allLetter)
    }
    
    /// 是否包含数字或字母的字符串
    func lgl_hasNumberOrLetter() -> Bool {
        return lgl_isMatch(regularString: .hasNumberLetter)
    }
    
    /// 是否同时包含数字和密码的字符串
    func lgl_bothNumberAndLetter() -> Bool {
        return lgl_isMatch(regularString: .bothNumberLetter)
    }
    
    /// 是否包含表情符
    func lgl_hasEmoji() -> Bool {
        return lgl_isMatch(regularString: .hasEmoji)
    }
    /// 是否包含中文字符
    func lgl_hasChinese() -> Bool {
        return lgl_isMatch(regularString: .hasChinese)
    }
}

// MARK: 给字符串添加下标索引存取功能

public extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        
        set {
            let tmp = self
            self = ""
            for (idx, item) in tmp.enumerated() {
                if idx == index {
                    self += "\(newValue)"
                }else{
                    self += "\(item)"
                }
            }
        }
    }
    
    /// 根据开始位置和长度截取字符串
    func subString(start: Int, length: Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy: start)
        let en = self.index(st, offsetBy: len)
        return String(self[st ..< en])
    }
}


// MARK: ---------------  NSAttributedString

public extension String {
    
    
    ///获取某一段文字的CGSize
    func lgl_getStrSize(_ font: UIFont, _ maxWidth: CGFloat) -> CGSize {
        return lgl_basekit_getStrSize(font, maxWidth)
    }
    
    ///修改指定文字的字体大小 和 颜色
    func lgl_modifyRangeText(_ changeText: String, _ changeColor: UIColor, _ changeFont: UIFont) -> NSAttributedString  {
        return lgl_basekit_modifyRangeText(changeText, changeColor, changeFont)
    }
    
    ///设置行间距
    func lgl_modifyLineHeight(_ lineHeight: CGFloat, _ alignment: NSTextAlignment) -> NSAttributedString {
        return lgl_basekit_modifyLineHeight(lineHeight, alignment)
    }
    
    ///设置指定范围内文字的颜色
    func lgl_modifyRangeTextColor(_ range: NSRange, _ changeColor: UIColor) -> NSAttributedString {
        return lgl_basekit_modifyRangeTextColor(range, changeColor)
    }
    
    ///设置指定范围内文字的下划线 颜色
    func lgl_modifyRangeUnderLine( _ range: NSRange, _ rangeColor: UIColor, _ lineColor:UIColor)  -> NSAttributedString {
        return lgl_basekit_modifyRangeUnderLine(range, rangeColor, lineColor)
    }
    
    ///设置行间距 和 首行缩进缩进两个字符
    func lgl_setHeadIndent(_ lineHeight: CGFloat, _ font: UIFont) -> NSAttributedString {
        return lgl_basekit_setHeadIndent(lineHeight, font)
    }
    
    ///设置一条文字中间的线
    func lgl_setThroughLine(_ range: NSRange, _ lineColor: UIColor) -> NSAttributedString {
        return lgl_basekit_setThroughLine(range, lineColor)
    }
    
    ///获取设置行高以后的字符串的Size(高)
    func lgl_getLineHeightSize(_ lineHeight: CGFloat, _ font: UIFont, _ maxW: CGFloat) -> CGSize {
        return lgl_basekit_getLineHeightWithSize(lineHeight, font, maxW)
    }
    
    ///文字用*号替换处理(eg:15118999 -> 151*****99)
    func lgl_replaceWithAsterisk(_ range: NSRange) -> String  {
        return lgl_basekit_replaceWithAsterisk(range)
    }
}


fileprivate extension String {
    ///判断文字的格式是否满足
    func lgl_basekit_judgeCharacterSetWithStr(_ characterStr: String, _ judgeText: String) -> Bool {
          let characterSet = NSCharacterSet(charactersIn: characterStr).inverted
          let filterArr:[String] = judgeText.components(separatedBy: characterSet)
          let filterstr:String = filterArr.joined(separator: "")
          let result:Bool = judgeText == filterstr
          if result {
              return true
          }
          return false
    }
    
    ///文字用*号替换处理
    func lgl_basekit_replaceWithAsterisk(_ range: NSRange) -> String {
        if self.count == 0 {
            return ""
        }
        var reultStr = NSString(string: self)
        var satrtLoctaion = range.location
        for _ in 0 ..< range.length {
            let replaceRange = NSRange(location: satrtLoctaion, length: 1)
            reultStr = reultStr.replacingCharacters(in: replaceRange, with: "*") as NSString
            satrtLoctaion = satrtLoctaion + 1
        }
        return reultStr as String
    }
    
    
    ///获取某一段文字的CGSize
    func lgl_basekit_getStrSize(_ font: UIFont, _ maxWidth: CGFloat) -> CGSize {
        let attrs = [NSAttributedString.Key.font: font]
        let showText = self as NSString
        let textRect:CGRect = showText.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options:[.usesLineFragmentOrigin, .truncatesLastVisibleLine, .usesFontLeading], attributes: attrs, context: nil)
        return textRect.size
    }
    
    ///修改指定文字的字体大小 和 颜色
    func lgl_basekit_modifyRangeText(_ changeText: String, _ changeColor: UIColor, _ changeFont: UIFont) -> NSAttributedString  {
        let attributStr = NSMutableAttributedString(string: self)
        let textStr = self as NSString
        let range = textStr.range(of: changeText)
        attributStr.addAttribute(NSAttributedString.Key.font, value: changeFont, range: range)
        attributStr.addAttribute(NSAttributedString.Key.foregroundColor, value: changeColor, range: range)
        return attributStr
    }
    
    ///设置行间距
    func lgl_basekit_modifyLineHeight(_ lineHeight: CGFloat, _ alignment:   NSTextAlignment) -> NSAttributedString {
        let attributStr = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        paragraphStyle.alignment = alignment;//文本对齐方式
        attributStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: self.count))
        return attributStr
    }
    
    ///设置指定范围内文字的颜色
    func lgl_basekit_modifyRangeTextColor(_ range: NSRange, _ changeColor: UIColor) -> NSAttributedString {
        let attributStr = NSMutableAttributedString(string: self)
        attributStr.addAttribute(NSAttributedString.Key.foregroundColor, value: changeColor, range: range)
        return attributStr
    }
    
    
    ///设置指定范围内文字的下划线 颜色
    func lgl_basekit_modifyRangeUnderLine( _ range: NSRange, _ rangeColor: UIColor, _ lineColor:UIColor)  -> NSAttributedString {
        let attributStr = NSMutableAttributedString(string: self)
        attributStr.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        attributStr.addAttribute(NSAttributedString.Key.foregroundColor, value: rangeColor, range: range)
        attributStr.addAttribute(NSAttributedString.Key.underlineColor, value: lineColor, range: range)
        return attributStr
    }
    
    ///设置行间距 和 首行缩进缩进两个字符
    func lgl_basekit_setHeadIndent(_ lineHeight: CGFloat, _ font: UIFont) -> NSAttributedString {
        let attributStr = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        paragraphStyle.alignment = .justified// 对齐方式
        paragraphStyle.firstLineHeadIndent = font.pointSize * 2 // 首行缩进
        paragraphStyle.headIndent = 0.0  // 头部缩进
        paragraphStyle.tailIndent = 0.0  // 尾部缩进
        attributStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: self.count))
        return attributStr
    }
    ///设置一条文字中间的线
    func lgl_basekit_setThroughLine(_ range: NSRange, _ lineColor: UIColor) -> NSAttributedString {
        let attributeStr = NSMutableAttributedString(string: self)
        attributeStr.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.strikethroughColor: lineColor], range: range)
        return attributeStr
    }
    
    ///获取设置行高以后的字符串的高度
    func lgl_basekit_getLineHeightWithSize(_ lineHeight: CGFloat, _ font: UIFont, _ maxW: CGFloat) -> CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        let text = self as NSString
        let textRect = text.boundingRect(with: CGSize(width: maxW, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font, NSAttributedString.Key.paragraphStyle:paragraphStyle ], context: nil)
        return textRect.size
    }
}


