//
//  Network.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import Foundation

class Network {
    class Api {
        /// Network get use get method
        /// - Parameters:
        ///   - url: Request api url, can not be nil.
        ///   - params: Parameters for request. can be nil.
        ///   - type: The fetch result will be format to Type as this parameter, can not be nil.
        ///   - completion: Fetch result will callback to caller user this parameter, can not be nil.
        static func get<T: Codable>(_ url:URL, _ params:[String:Any]?, _ type: T.Type, completion:@escaping (_ data: T?, _ error: Error?)->Void) {
            DispatchQueue.global().async {
                let request = URLRequest(url: url)
                URLSession.shared.dataTask(with: request) {  data, response, error in
                    guard error == nil, let data = data else {
                        completion(nil, error)
                        return
                    }
                    let jsonDecoder = JSONDecoder()
                    do {
                        let datas = try jsonDecoder.decode(type, from: data)
                        DispatchQueue.main.async {
                            completion(datas, nil)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(nil, error)
                        }
                    }
                    
                }.resume()
            }
        }
    }
}
