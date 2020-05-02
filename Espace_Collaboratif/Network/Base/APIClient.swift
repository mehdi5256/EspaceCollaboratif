//
//  File.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Alamofire
import Promises

open class APIClient {

    @discardableResult
    static func performRequest<T: Decodable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder())->Promise<T> {
        print(route)
        return Promise<T> { fulfill, reject in
 
                AF.request(route).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let value):
                        
                        fulfill(value)
                    case .failure(let error):
                        reject(error)
                    }
                })
 
        }
    }
    
    
    
    @discardableResult
    static func performFullResponseRequest(route: APIConfiguration) -> Promise<DataResponse<Data?, AFError>> {
        return Promise<DataResponse<Data?, AFError>> { fulfill, reject in
                AF.request(route).response( completionHandler: { (response: DataResponse<Data?, AFError>) in
                    switch response.result {
                    case .success:
                      fulfill(response)
                    case .failure(let error):
                      reject(error)
                    }
                })
 
        }
    }
    @discardableResult
    static func performDownloadRequest(route: APIConfiguration, interceptor: RequestInterceptor?, destination: DownloadRequest.Destination?) -> Promise<DownloadResponse<Data, AFError>> {
        return Promise<DownloadResponse<Data, AFError>> { fulfill, reject in
         
                AF.download(route, interceptor: interceptor, to: destination).responseData(completionHandler: { response in
                   switch response.result {
                   case .success:
                       fulfill(response)
                   case .failure(let error):
                       reject(error)
                   }
                 })
 
        }
    }
    @discardableResult
    static func performUploadRequest<T: Decodable>(route: APIConfiguration, multipartFormData: MultipartFormData, decoder: JSONDecoder = JSONDecoder())->Promise<T> {
        return Promise<T> { fulfill, reject in
 
                print(multipartFormData.contentType)
                AF.upload(multipartFormData: multipartFormData, with: route).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                  
                     print(response.result)
                     switch response.result {
                     case .success(let value):
                        fulfill(value)
                     case .failure(let error):
                        reject(error)
                     }
               })
 
        }
    }
    
    @discardableResult
      static func performUploadAbsenceRequest(route: APIConfiguration, multipartFormData: MultipartFormData)->Promise<AFDataResponse<String>> {
          return Promise<AFDataResponse<String>> { fulfill, reject in
 
                AF.upload(multipartFormData: multipartFormData, with: route).responseString { response in
                             
                     switch response.result {
                     case .success:
                         fulfill(response)
                     case .failure(let error):
                         reject(error)
                     }
                }
 
        }
      }
   
 
}
