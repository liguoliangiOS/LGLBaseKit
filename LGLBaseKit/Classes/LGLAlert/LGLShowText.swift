//
//  LGLShowText.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/11/4.
//

import UIKit

fileprivate let Screen_W:CGFloat = UIScreen.main.bounds.width
fileprivate let Screen_H:CGFloat = UIScreen.main.bounds.height


class LGLShowText: UIView {
    
    class func showTextView(_ message: String?)  {
        if message != nil {
            DispatchQueue.main.async {
                let erroView = LGLShowText(frame: UIScreen.main.bounds, error: message!, textFont: UIFont.systemFont(ofSize: 15))
                let window:UIWindow = UIApplication.shared.windows[0]
                window.addSubview(erroView)
            }
        }
    }
    
    class func showTextView(_ message: String?, _ textFont: UIFont)  {
        if message != nil {
            DispatchQueue.main.async {
                let erroView = LGLShowText(frame: UIScreen.main.bounds, error: message!, textFont: textFont)
                let window:UIWindow = UIApplication.shared.windows[0]
                window.addSubview(erroView)
            }
        }
    }
    
    convenience init(frame: CGRect, error: String, textFont: UIFont) {
        self.init(frame: frame)
        lgl_basekit_setTextSubViews(error, textFont)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension LGLShowText {
    
    func lgl_basekit_setTextSubViews(_ showText: String, _ textFont: UIFont) {
        
        let marginX:CGFloat = 20
        let valibleW:CGFloat = Screen_W - marginX * 2
        
        let paddingX:CGFloat = 30
        let paddingY:CGFloat = 20
        
        let size:CGSize = lgl_basekit_strSize(showText, textFont, valibleW)
        
        var totalW:CGFloat = size.width + paddingX
        let totalH:CGFloat = size.height + paddingY
        
        if totalW > valibleW {
            totalW = valibleW
        }
        let totalY:CGFloat = (Screen_H / 2 - totalH)
        let totalX:CGFloat = (Screen_W - totalW) / 2
        
        let textLabel = UILabel(frame: CGRect(x: totalX, y: totalY, width: totalW, height: totalH))
        textLabel.text = showText
        textLabel.textColor = .white
        textLabel.font = textFont
        textLabel.numberOfLines = 0
        textLabel.backgroundColor = lgl_basekit_color()
        textLabel.textAlignment = .center
        textLabel.layer.masksToBounds = true
        textLabel.layer.cornerRadius = 4
        self.addSubview(textLabel)
        
        lgl_basekit_hidddenErrorView(textLabel)
    }
    
    private func lgl_basekit_hidddenErrorView(_ label: UILabel) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5, execute: {
            self.removeFromSuperview()
            label.removeFromSuperview()
        })
    }
    
    ///获取某一段文字的CGSize
    private func lgl_basekit_strSize(_ text:String, _ font: UIFont, _ maxWidth: CGFloat) -> CGSize {
           let attrs = [NSAttributedString.Key.font: font]
           let showText = text as NSString
           let textRect:CGRect = showText.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options:[.usesLineFragmentOrigin, .truncatesLastVisibleLine, .usesFontLeading], attributes: attrs, context: nil)
           return textRect.size
    }
    
    private func lgl_basekit_color() -> UIColor {
        let red = CGFloat(85)/255.0
        let green = CGFloat(85)/255.0
        let blue = CGFloat(85)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
