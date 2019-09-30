//
//  LGLCrypt.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/9/21.
//

import UIKit

///RSA加密钥匙串私钥使用的key
public let LGL_RSA_PRIVATE_KEY:String = "LGL_RSAUtil_PrivKey"
///RSA加密钥匙串公钥使用的key
public let LGL_RSA_PUBLIC_KEY:String = "LGL_RSAUtil_PubKey"

//MARK: ---- MD5加密 ----
public class LGLCrypt {
    ///MD5加密
    public static func lgl_md5Encrypt(_ text: String ) -> String {
        return text.md5Encrypt()
    }
}

//MARK: ---- AES 加解密 ----
public extension LGLCrypt {
    
    ///AES加密（[UInt8]c形式的key和iv）
    static func lgl_aesEncrypt(_ text: String, _ key:[UInt8], _ iv:[UInt8]) -> String? {
        guard let result = text.aesCBCEncrypt(String(data: Data.init(key), encoding: .utf8)!, iv: String(data: Data.init(iv), encoding: .utf8)!) else { return nil }
        let encryptedDataText = result.base64EncodedString(options: NSData.Base64EncodingOptions())
        return encryptedDataText
    }
    
    ///AES解密([UInt8]c形式的key和iv)
    static func lgl_aesDecrypt(_ aesText: String, _ key:[UInt8], _ iv:[UInt8]) -> String? {
        guard let deResult = aesText.aesCBCDecryptFromBase64(String(data: Data.init(key), encoding: .utf8)!, iv: String(data: Data.init(iv), encoding: .utf8)!) else { return nil }
        return deResult
    }
    
    ///AES加密(字符串形式的key和iv)
    static func lgl_aesEncryptStr(_ text: String, _ key:String, _ iv:String) -> String? {
        let result = text.aesCBCEncrypt(key, iv: iv)
        let encryptedDataText = result!.base64EncodedString(options: NSData.Base64EncodingOptions())
        return encryptedDataText
    }
    
    ///AES解密(字符串形式的key和iv)
    static func lgl_aesDecryptStr(_ aesText: String, _ key:String, _ iv:String) -> String? {
        guard let deResult = aesText.aesCBCDecryptFromBase64(key, iv: iv) else { return nil }
        return deResult
    }
}


//MARK: ---- RSA 加解密 ----

public extension LGLCrypt {
    
    /// RSA签名
    static func lgl_rsaSignWithSHA1(_ text: String, _ privateKey: String, _ privateKeychainTag:String = LGL_RSA_PRIVATE_KEY) -> String? {
        guard let textData = text.data(using: String.Encoding.utf8) else { return nil }
        let siginData = RSACrypt.siginWithRsaSHA1(textData, privateKey, privateKeychainTag)
        if  siginData != nil {
            let encryptedDataText = siginData!.base64EncodedString(options: NSData.Base64EncodingOptions())
            return encryptedDataText
        } else {
            print("Error while sigining")
            return nil
        }
    }
    
    
    /// RSA验签
    static func lgl_rsaSignVerifyWithSHA1(_ originalStr: String, _ siginStr: String, _ publicKey: String, _ privateKeychainTag:String = LGL_RSA_PRIVATE_KEY) -> Bool {
        return RSACrypt.verifySigin(originalStr, siginStr, publicKey, privateKeychainTag)
    }
    
    /// RSA公钥加密
    static func lgl_rsaEncrypt(_ text: String, _ publicKey: String, _ publicKeychainTag:String = LGL_RSA_PUBLIC_KEY) -> String? {
        guard let textData = text.data(using: String.Encoding.utf8) else { return nil }
        let encryptedData = RSACrypt.encryptWithRSAPublicKey(textData, pubkeyBase64: publicKey, keychainTag: publicKeychainTag)
        if ( encryptedData == nil ) {
            print("Error while encrypting")
            return nil
        } else {
            let encryptedDataText = encryptedData!.base64EncodedString(options: NSData.Base64EncodingOptions())
            return encryptedDataText
        }
    }
    
    /// RSA私钥解密
    static func lgl_rsaDecrypt(_ encryptData: String, _ privateKey: String, _ privateKeychainTag:String = LGL_RSA_PRIVATE_KEY) -> String? {
        guard let baseDecodeData = Data(base64Encoded: encryptData, options: NSData.Base64DecodingOptions()) else { return nil }
        let decryptedInfo = RSACrypt.decryptWithRSAPrivateKey(baseDecodeData, privkeyBase64: privateKey, keychainTag: privateKeychainTag)
        if ( decryptedInfo != nil ) {
            let result = String(data: decryptedInfo!, encoding: .utf8)
            return result
        } else {
            print("Error while decrypting")
            return nil
        }
    }
    
    /// RSA公钥解密
    static func lgl_rsaDecryptPublic(_ encryptData: String, _ publicKey: String, _ publicKeychainTag:String = LGL_RSA_PUBLIC_KEY) -> String? {
        
        guard let baseDecodeData = Data(base64Encoded: encryptData, options: NSData.Base64DecodingOptions()) else { return nil }
        let decryptedInfo = RSACrypt.decryptWithRSAPublicKey(baseDecodeData, pubkeyBase64: publicKey, keychainTag: publicKeychainTag)
        if ( decryptedInfo != nil ) {
            let result = String(data: decryptedInfo!, encoding: .utf8)
            return result
        } else {
            print("Error while decrypting")
            return nil
        }
    }
}
