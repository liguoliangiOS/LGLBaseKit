//
//  BaseCrypt.swift
//  LGLBaseKit
//
//  Created by Passer on 2019/9/21.
//

import UIKit
import CommonCrypto
import Security

///AES（128+CBC+PKCS7Padding） Md5
internal extension Data {
    // MARK: cbc
    fileprivate func aesCBC(_ operation:CCOperation,key:String, iv:String? = nil) -> Data? {
        guard [16,24,32].contains(key.lengthOfBytes(using: String.Encoding.utf8)) else {
            return nil
        }
        let input_bytes = self.arrayOfBytes()
        let key_bytes = key.bytes
        var encrypt_length = Swift.max(input_bytes.count * 2, 16)
        var encrypt_bytes = [UInt8](repeating: 0,
                                    count: encrypt_length)
        
        let iv_bytes = (iv != nil) ? iv?.bytes : nil
        let status = CCCrypt(UInt32(operation),
                             UInt32(kCCAlgorithmAES128),
                             UInt32(kCCOptionPKCS7Padding),
                             key_bytes,
                             key.lengthOfBytes(using: String.Encoding.utf8),
                             iv_bytes,
                             input_bytes,
                             input_bytes.count,
                             &encrypt_bytes,
                             encrypt_bytes.count,
                             &encrypt_length)
        if status == Int32(kCCSuccess) {
            return Data(bytes: UnsafePointer<UInt8>(encrypt_bytes), count: encrypt_length)
        }
        return nil
    }
    
    fileprivate func aesCBCEncrypt(_ key:String,iv:String? = nil) -> Data? {
        return aesCBC(UInt32(kCCEncrypt), key: key, iv: iv)
    }
    
    fileprivate func aesCBCDecrypt(_ key:String,iv:String? = nil)->Data?{
        return aesCBC(UInt32(kCCDecrypt), key: key, iv: iv)
    }
}


internal extension String {
    // MARK: cbc
    func aesCBCEncrypt(_ key:String,iv:String? = nil) -> Data? {
        let data = self.data(using: String.Encoding.utf8)
        return data?.aesCBCEncrypt(key, iv: iv)
    }
    
    func aesCBCDecryptFromHex(_ key:String,iv:String? = nil) ->String?{
        let data = self.dataFromHexadecimalString()
        guard let raw_data = data?.aesCBCDecrypt(key, iv: iv) else{
            return nil
        }
        return String(data: raw_data, encoding: String.Encoding.utf8)
    }
    
    func aesCBCDecryptFromBase64(_ key:String, iv:String? = nil) ->String? {
        let data = Data(base64Encoded: self, options: NSData.Base64DecodingOptions())
        guard let raw_data = data?.aesCBCDecrypt(key, iv: iv) else{
            return nil
        }
        return String(data: raw_data, encoding: String.Encoding.utf8)
    }
    
    //MD5加密
    func md5Encrypt() -> String {
        let utf8_str = self.cString(using: .utf8)
        let str_len = CC_LONG(self.lengthOfBytes(using: .utf8))
        let digest_len = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digest_len)
        CC_MD5(utf8_str, str_len, result)
        let str = NSMutableString()
        for i in 0..<digest_len {
            str.appendFormat("%02x", result[i])
        }
        result.deallocate()
        return str as String
    }
}

//MARK: ----- Extension ----------

internal extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

internal extension UInt {
    subscript(digitIndex: Int) -> UInt {
        var decimalBase:UInt = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

internal extension UInt8 {
    subscript(digitIndex: Int) -> UInt8 {
        var decimalBase:UInt8 = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
internal extension Data {
    func hexadecimalString() -> String {
        let string = NSMutableString(capacity: count * 2)
        var byte: UInt8 = 0
        for i in 0 ..< count {
            copyBytes(to: &byte, from: i..<index(after: i))
            string.appendFormat("%02x", byte)
        }
        
        return string as String
    }
    var hexString : String {
        return self.hexadecimalString()
    }
    var base64String:String {
        return self.base64EncodedString(options: NSData.Base64EncodingOptions())
    }
    func arrayOfBytes() -> [UInt8] {
        let count = self.count / MemoryLayout<UInt8>.size
        var bytesArray = [UInt8](repeating: 0, count: count)
        (self as NSData).getBytes(&bytesArray, length:count * MemoryLayout<UInt8>.size)
        return bytesArray
    }
}
internal extension String {
    /// Array of UInt8
    var arrayOfBytes:[UInt8] {
        let data = self.data(using: String.Encoding.utf8)!
        return data.arrayOfBytes()
    }
    var bytes:UnsafeRawPointer{
        let data = self.data(using: String.Encoding.utf8)!
        return (data as NSData).bytes
    }
    func dataFromHexadecimalString() -> Data? {
        let trimmedString = self.trimmingCharacters(in: CharacterSet(charactersIn: "<> ")).replacingOccurrences(of: " ", with: "")
        
        guard let regex = try? NSRegularExpression(pattern: "^[0-9a-f]*$", options: NSRegularExpression.Options.caseInsensitive) else{
            return nil
        }
        let trimmedStringLength = trimmedString.lengthOfBytes(using: String.Encoding.utf8)
        let found = regex.firstMatch(in: trimmedString, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, trimmedStringLength))
        if found == nil || found?.range.location == NSNotFound || trimmedStringLength % 2 != 0 {
            return nil
        }
        
        var data = Data(capacity: trimmedStringLength / 2)
        
        for index in trimmedString.indices {
            let next_index = trimmedString.index(after: index)
            let byteString = String(trimmedString[index ..< next_index]) //trimmedString.substring(with: )
            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
            data.append(num)
        }
        return data
    }
}



///MARK: --- ---------- RSA --------------


internal class RSACrypt: NSObject {
    
    // Configuration keys
    struct Config {
        /// Determines whether to add key hash to the keychain path when searching for a key
        /// or when adding a key to keychain
        static var useKeyHashes = true
    }
    
    // Base64 encode a block of data
    class fileprivate func base64Encode(_ data: Data) -> String {
        return data.base64EncodedString(options: [])
    }
    
    // Base64 decode a base64-ed string
    class fileprivate func base64Decode(_ strBase64: String) -> Data {
        let data = Data(base64Encoded: strBase64, options: [])
        return data!
    }
    
    // Encrypts data with a RSA key
    class open func encryptWithRSAKey(_ data: Data, rsaKeyRef: SecKey, padding: SecPadding) -> Data? {
        let blockSize = SecKeyGetBlockSize(rsaKeyRef)
        let maxChunkSize = blockSize - 11
        
        var decryptedDataAsArray = [UInt8](repeating: 0, count: data.count / MemoryLayout<UInt8>.size)
        (data as NSData).getBytes(&decryptedDataAsArray, length: data.count)
        
        var encryptedData = [UInt8](repeating: 0, count: 0)
        var idx = 0
        while (idx < decryptedDataAsArray.count ) {
            var idxEnd = idx + maxChunkSize
            if ( idxEnd > decryptedDataAsArray.count ) {
                idxEnd = decryptedDataAsArray.count
            }
            var chunkData = [UInt8](repeating: 0, count: maxChunkSize)
            for i in idx..<idxEnd {
                chunkData[i-idx] = decryptedDataAsArray[i]
            }
            
            var encryptedDataBuffer = [UInt8](repeating: 0, count: blockSize)
            var encryptedDataLength = blockSize
            
            let status = SecKeyEncrypt(rsaKeyRef, padding, chunkData, idxEnd-idx, &encryptedDataBuffer, &encryptedDataLength)
            if ( status != noErr ) {
                NSLog("Error while ecrypting: %i", status)
                return nil
            }
            //let finalData = removePadding(encryptedDataBuffer)
            encryptedData += encryptedDataBuffer
            
            idx += maxChunkSize
        }
        
        return Data(bytes: UnsafePointer<UInt8>(encryptedData), count: encryptedData.count)
    }
    
    // Decrypt an encrypted data with a RSA key
    class open func decryptWithRSAKey(_ encryptedData: Data, rsaKeyRef: SecKey, padding: SecPadding) -> Data? {
        let blockSize = SecKeyGetBlockSize(rsaKeyRef)
        
        var encryptedDataAsArray = [UInt8](repeating: 0, count: encryptedData.count / MemoryLayout<UInt8>.size)
        (encryptedData as NSData).getBytes(&encryptedDataAsArray, length: encryptedData.count)
        
        var decryptedData = [UInt8](repeating: 0, count: 0)
        var idx = 0
        while (idx < encryptedDataAsArray.count ) {
            var idxEnd = idx + blockSize
            if ( idxEnd > encryptedDataAsArray.count ) {
                idxEnd = encryptedDataAsArray.count
            }
            var chunkData = [UInt8](repeating: 0, count: blockSize)
            for i in idx..<idxEnd {
                chunkData[i-idx] = encryptedDataAsArray[i]
            }
            
            var decryptedDataBuffer = [UInt8](repeating: 0, count: blockSize)
            var decryptedDataLength = blockSize
            
            let status = SecKeyDecrypt(rsaKeyRef, padding, chunkData, idxEnd-idx, &decryptedDataBuffer, &decryptedDataLength)
            if ( status != noErr ) {
                return nil
            }
            let finalData = removePadding(decryptedDataBuffer)
            decryptedData += finalData
            
            idx += blockSize
        }
        
        return Data(bytes: UnsafePointer<UInt8>(decryptedData), count: decryptedData.count)
    }
    
    class fileprivate func removePadding(_ data: [UInt8]) -> [UInt8] {
        var idxFirstZero = -1
        var idxNextZero = data.count
        for i in 0..<data.count {
            if ( data[i] == 0 ) {
                if ( idxFirstZero < 0 ) {
                    idxFirstZero = i
                } else {
                    idxNextZero = i
                    break
                }
            }
        }
        var newData = [UInt8](repeating: 0, count: idxNextZero-idxFirstZero-1)
        for i in idxFirstZero+1..<idxNextZero {
            newData[i-idxFirstZero-1] = data[i]
        }
        return newData
    }
    
    // Verify that the supplied key is in fact a X509 public key and strip the header
    // On disk, a X509 public key file starts with string "-----BEGIN PUBLIC KEY-----",
    // and ends with string "-----END PUBLIC KEY-----"
    class fileprivate func stripPublicKeyHeader(_ pubkey: Data) -> Data? {
        if ( pubkey.count == 0 ) {
            return nil
        }
        
        var keyAsArray = [UInt8](repeating: 0, count: pubkey.count / MemoryLayout<UInt8>.size)
        (pubkey as NSData).getBytes(&keyAsArray, length: pubkey.count)
        
        var idx = 0
        if (keyAsArray[idx] != 0x30) {
            return nil
        }
        idx += 1
        
        if (keyAsArray[idx] > 0x80) {
            idx += Int(keyAsArray[idx]) - 0x80 + 1
        } else {
            idx += 1
        }
        
        let seqiod = [UInt8](arrayLiteral: 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00)
        for i in idx..<idx+15 {
            if ( keyAsArray[i] != seqiod[i-idx] ) {
                return nil
            }
        }
        idx += 15
        
        if (keyAsArray[idx] != 0x03) {
            return nil
        }
        idx += 1
        
        if (keyAsArray[idx] > 0x80) {
            idx += Int(keyAsArray[idx]) - 0x80 + 1;
        } else {
            idx += 1
        }
        
        if (keyAsArray[idx] != 0x00) {
            return nil
        }
        idx += 1
        //return pubkey.subdata(in: idx..<keyAsArray.count - idx)
        //return pubkey.subdata(in: NSMakeRange(idx, keyAsArray.count - idx))
        return pubkey.subdata(in:Range(NSMakeRange(idx, keyAsArray.count - idx))!)
    }
    
    // Verify that the supplied key is in fact a PEM RSA private key key and strip the header
    // On disk, a PEM RSA private key file starts with string "-----BEGIN RSA PRIVATE KEY-----",
    // and ends with string "-----END RSA PRIVATE KEY-----"
    class fileprivate func stripPrivateKeyHeader(_ privkey: Data) -> Data? {
        if ( privkey.count == 0 ) {
            return nil
        }
        
        var keyAsArray = [UInt8](repeating: 0, count: privkey.count / MemoryLayout<UInt8>.size)
        (privkey as NSData).getBytes(&keyAsArray, length: privkey.count)
        
        //magic byte at offset 22, check if it's actually ASN.1
        var idx = 22
        if ( keyAsArray[idx] != 0x04 ) {
            return nil
        }
        idx += 1
        
        //now we need to find out how long the key is, so we can extract the correct hunk
        //of bytes from the buffer.
        var len = Int(keyAsArray[idx])
        idx += 1
        let det = len & 0x80 //check if the high bit set
        if (det == 0) {
            //no? then the length of the key is a number that fits in one byte, (< 128)
            len = len & 0x7f
        } else {
            //otherwise, the length of the key is a number that doesn't fit in one byte (> 127)
            var byteCount = Int(len & 0x7f)
            if (byteCount + idx > privkey.count) {
                return nil
            }
            //so we need to snip off byteCount bytes from the front, and reverse their order
            var accum: UInt = 0
            var idx2 = idx
            idx += byteCount
            while (byteCount > 0) {
                //after each byte, we shove it over, accumulating the value into accum
                accum = (accum << 8) + UInt(keyAsArray[idx2])
                idx2 += 1
                byteCount -= 1
            }
            // now we have read all the bytes of the key length, and converted them to a number,
            // which is the number of bytes in the actual key.  we use this below to extract the
            // key bytes and operate on them
            len = Int(accum)
        }
        
        //return privkey.subdata(in: idx..<len)
        //return privkey.subdata(in: NSMakeRange(idx, len))
        return privkey.subdata(in: Range(NSMakeRange(idx, len))!)
    }
    
    // Delete any existing RSA key from keychain
    class open func deleteRSAKeyFromKeychain(_ tagName: String) {
        let queryFilter: [String: AnyObject] = [
            String(kSecClass)             : kSecClassKey,
            String(kSecAttrKeyType)       : kSecAttrKeyTypeRSA,
            String(kSecAttrApplicationTag): tagName as AnyObject
        ]
        SecItemDelete(queryFilter as CFDictionary)
    }
    
    // Get a SecKeyRef from keychain
    class open func getRSAKeyFromKeychain(_ tagName: String) -> SecKey? {
        let queryFilter: [String: AnyObject] = [
            String(kSecClass)             : kSecClassKey,
            String(kSecAttrKeyType)       : kSecAttrKeyTypeRSA,
            String(kSecAttrApplicationTag): tagName as AnyObject,
            //String(kSecAttrAccessible)    : kSecAttrAccessibleWhenUnlocked,
            String(kSecReturnRef)         : true as AnyObject
        ]
        
        var keyPtr: AnyObject?
        let result = SecItemCopyMatching(queryFilter as CFDictionary, &keyPtr)
        if ( result != noErr || keyPtr == nil ) {
            return nil
        }
        return keyPtr as! SecKey?
    }
    
    // Add a RSA private key to keychain and return its SecKeyRef
    // privkeyBase64: RSA private key in base64 (data between "-----BEGIN RSA PRIVATE KEY-----" and "-----END RSA PRIVATE KEY-----")
    class open func addRSAPrivateKey(_ privkeyBase64: String, tagName: String) -> SecKey? {
        return addRSAPrivateKey(privkey: base64Decode(privkeyBase64), tagName: tagName)
    }
    
    class fileprivate func addRSAPrivateKey(privkey: Data, tagName: String) -> SecKey? {
        // Delete any old lingering key with the same tag
        deleteRSAKeyFromKeychain(tagName)
        
        let privkeyData = stripPrivateKeyHeader(privkey)
        if ( privkeyData == nil ) {
            return nil
        }
        
        // Add persistent version of the key to system keychain
        // var prt: AnyObject?
        let queryFilter = [
            String(kSecClass)              : kSecClassKey,
            String(kSecAttrKeyType)        : kSecAttrKeyTypeRSA,
            String(kSecAttrApplicationTag) : tagName,
            //String(kSecAttrAccessible)     : kSecAttrAccessibleWhenUnlocked,
            String(kSecValueData)          : privkeyData!,
            String(kSecAttrKeyClass)       : kSecAttrKeyClassPrivate,
            String(kSecReturnPersistentRef): true
            ] as [String : Any]
        let result = SecItemAdd(queryFilter as CFDictionary, nil)
        if ((result != noErr) && (result != errSecDuplicateItem)) {
            return nil
        }
        
        return getRSAKeyFromKeychain(tagName)
    }
    
    // Add a RSA pubic key to keychain and return its SecKeyRef
    // pubkeyBase64: RSA public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
    class open func addRSAPublicKey(_ pubkeyBase64: String, tagName: String) -> SecKey? {
        return addRSAPublicKey(pubkey: base64Decode(pubkeyBase64), tagName: tagName)
    }
    
    class fileprivate func addRSAPublicKey(pubkey: Data, tagName: String) -> SecKey? {
        // Delete any old lingering key with the same tag
        deleteRSAKeyFromKeychain(tagName)
        
        let pubkeyData = stripPublicKeyHeader(pubkey)
        if ( pubkeyData == nil ) {
            return nil
        }
        
        // Add persistent version of the key to system keychain
        //var prt1: Unmanaged<AnyObject>?
        let queryFilter = [
            String(kSecClass)              : kSecClassKey,
            String(kSecAttrKeyType)        : kSecAttrKeyTypeRSA,
            String(kSecAttrApplicationTag) : tagName,
            String(kSecValueData)          : pubkeyData!,
            String(kSecAttrKeyClass)       : kSecAttrKeyClassPublic,
            String(kSecReturnPersistentRef): true
            ] as [String : Any]
        let result = SecItemAdd(queryFilter as CFDictionary, nil)
        if ((result != noErr) && (result != errSecDuplicateItem)) {
            return nil
        }
        
        return getRSAKeyFromKeychain(tagName)
    }
    
    // Encrypt data with a RSA private key
    // privkeyBase64: RSA private key in base64 (data between "-----BEGIN RSA PRIVATE KEY-----" and "-----END RSA PRIVATE KEY-----")
    // NOT WORKING YET!
    class open func encryptWithRSAPrivateKey(_ data: Data, privkeyBase64: String, keychainTag: String) -> Data? {
        let myKeychainTag = keychainTag + (Config.useKeyHashes ? "-" + String(privkeyBase64.hashValue) : "")
        var keyRef = getRSAKeyFromKeychain(myKeychainTag)
        if ( keyRef == nil ) {
            keyRef = addRSAPrivateKey(privkeyBase64, tagName: myKeychainTag)
        }
        if ( keyRef == nil ) {
            return nil
        }
        
        return encryptWithRSAKey(data, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }
    
    // Encrypt data with a RSA public key
    // pubkeyBase64: RSA public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
    class open func encryptWithRSAPublicKey(_ data: Data, pubkeyBase64: String, keychainTag: String) -> Data? {
        let myKeychainTag = keychainTag + (Config.useKeyHashes ? "-" + String(pubkeyBase64.hashValue) : "")
        var keyRef = getRSAKeyFromKeychain(myKeychainTag)
        if ( keyRef == nil ) {
            keyRef = addRSAPublicKey(pubkeyBase64, tagName: myKeychainTag)
        }
        if ( keyRef == nil ) {
            return nil
        }
        
        return encryptWithRSAKey(data, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }
    
    // Decrypt an encrypted data with a RSA private key
    // privkeyBase64: RSA private key in base64 (data between "-----BEGIN RSA PRIVATE KEY-----" and "-----END RSA PRIVATE KEY-----")
    class open func decryptWithRSAPrivateKey(_ encryptedData: Data, privkeyBase64: String, keychainTag: String) -> Data? {
        let myKeychainTag = keychainTag + (Config.useKeyHashes ? "-" + String(privkeyBase64.hashValue) : "")
        var keyRef = getRSAKeyFromKeychain(myKeychainTag)
        if ( keyRef == nil ) {
            keyRef = addRSAPrivateKey(privkeyBase64, tagName: myKeychainTag)
        }
        if ( keyRef == nil ) {
            return nil
        }
        
        return decryptWithRSAKey(encryptedData, rsaKeyRef: keyRef!, padding: SecPadding())
    }
    
    // Decrypt an encrypted data with a RSA public key
    // pubkeyBase64: RSA public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
    class open func decryptWithRSAPublicKey(_ encryptedData: Data, pubkeyBase64: String, keychainTag: String) -> Data? {
        let myKeychainTag = keychainTag + (Config.useKeyHashes ? "-" + String(pubkeyBase64.hashValue) : "")
        var keyRef = getRSAKeyFromKeychain(myKeychainTag)
        if ( keyRef == nil ) {
            keyRef = addRSAPublicKey(pubkeyBase64, tagName: myKeychainTag)
        }
        if ( keyRef == nil ) {
            return nil
        }
        return decryptWithRSAKey(encryptedData, rsaKeyRef: keyRef!, padding: SecPadding())
    }
    
    
    class open func siginWithRsaSHA1(_ singData: Data, _ privateBase64: String, _ keychainTag: String) -> Data? {
        let myKeychainTag = keychainTag + (Config.useKeyHashes ? "-" + String(privateBase64.hashValue) : "")
        var keyRef = getRSAKeyFromKeychain(myKeychainTag)
        if ( keyRef == nil ) {
            keyRef = addRSAPrivateKey(privateBase64, tagName: myKeychainTag)
        }
        if ( keyRef == nil ) {
            return nil
        }
        
        if  let hash = NSMutableData(length: Int(CC_SHA1_DIGEST_LENGTH)) {
            CC_SHA1((singData as NSData).bytes, CC_LONG(singData.count), hash.mutableBytes.assumingMemoryBound(to: UInt8.self))
            let blockSize = SecKeyGetBlockSize(keyRef!)
            let hashDataLength = Int(hash.length)
            let hashData = hash.bytes.bindMemory(to: UInt8.self, capacity: hash.length)
            if let result = NSMutableData(length: Int(blockSize)) {
                let encryptedData = result.mutableBytes.assumingMemoryBound(to: UInt8.self)
                var encryptedDataLength = blockSize
                let status = SecKeyRawSign(keyRef!, .PKCS1SHA1, hashData, hashDataLength, encryptedData, &encryptedDataLength)
                if status == noErr {
                    result.length = encryptedDataLength
                    return result as Data
                }
            }
        }
        return nil
    }
    
    class open func verifySigin(_ originalData: String, _ singData: String, _ publicBase64: String, _ keychainTag: String) -> Bool  {
        
        if let data = originalData.data(using: String.Encoding.utf8), let signature = Data(base64Encoded: singData, options: NSData.Base64DecodingOptions(rawValue: 0)) {
            let myKeychainTag = keychainTag + (Config.useKeyHashes ? "-" + String(publicBase64.hashValue) : "")
            var keyRef = getRSAKeyFromKeychain(myKeychainTag)
            if ( keyRef == nil ) {
                keyRef = addRSAPublicKey(publicBase64, tagName: myKeychainTag)
            }
            if ( keyRef == nil ) {
                return false
            }
            if let hashData = NSMutableData(length: Int(CC_SHA1_DIGEST_LENGTH)) {
                CC_SHA1((data as NSData).bytes, CC_LONG(data.count), hashData.mutableBytes.assumingMemoryBound(to: UInt8.self))
                let signedData = hashData.bytes.bindMemory(to: UInt8.self, capacity: hashData.length)
                let signatureLength = Int(signature.count)
                let signatureData = (signature as NSData).bytes.bindMemory(to: UInt8.self, capacity: signature.count)
                let result = SecKeyRawVerify(keyRef!, .PKCS1SHA1, signedData, Int(CC_SHA1_DIGEST_LENGTH), signatureData, signatureLength)
                switch result {
                case noErr:
                    return true
                default:
                    return false
                }
            }
        }
        return false
    }
}



