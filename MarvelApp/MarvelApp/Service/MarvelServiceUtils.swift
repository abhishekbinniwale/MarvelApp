//
//  MarvelServiceUtils.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 02/05/22.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG


class MarvelServiceUtils {
    
    static func buildServiceRequestUrl (baseUrl: String, params: [String : String]? = nil) -> String? {
        if var urlComponents = URLComponents(string: baseUrl) {
            let ts = "\(Int((Date().timeIntervalSince1970 * 1000.0).rounded()))"
            let publicKey = MarvelConfig.publicKey
            let privateKey = MarvelConfig.privateKey
            let privateKeyMd5 = MD5Hex(string: "\(ts)\(privateKey)\(publicKey)")
            
            //addd auth params
            var requestParams = params ?? [String : String]()
            requestParams["ts"] = ts
            requestParams["apikey"] = publicKey
            requestParams["hash"] = privateKeyMd5
            
            //build query string
            var queryItems = [URLQueryItem]()
            for (key, value) in requestParams {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            
            urlComponents.queryItems = queryItems
            
            if let urlAbsoluteString = urlComponents.url?.absoluteString {
                return urlAbsoluteString
            }
        }
        
        return nil
    }

    //code from: https://stackoverflow.com/questions/32163848/how-can-i-convert-a-string-to-an-md5-hash-in-ios-using-swift
    static func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }

    static func MD5Hex(string: String) -> String {
        let md5Data = MD5(string: string)
        return md5Data.map { String(format: "%02hhx", $0) }.joined()
    }
    
    static func get(url: String, onResult: @escaping (Data?) -> Void){
        guard let url = URL(string: url) else{
            onResult(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in

            if let response = data {
                onResult(response)
                
            }else{
                onResult(nil)
            }
        }

        task.resume()
    }
    
}
