//
//  Request.swift
//  MovieApp
//
//  Created by macbook on 7/10/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import Foundation

//
//  WeatherService.swift
//  WeatherApp
//
//  Created by macbook on 6/13/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//
import Foundation

struct Constants {
    static let BASEURL : String = "https://api.themoviedb.org/3"
    static let API_KEY = "15e99ded3a1a087468a9596f5b58db5c"
}

class RequestService {
    
    func httpRequest <T: Codable>(
            endpoint: String,
            method : String,

            completion: @escaping(T?, Error?) -> Void
        ) {
        
        guard let url = URL(string : Constants.BASEURL + endpoint+"?api_key="+Constants.API_KEY) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: [], options: []) else {
            return
        }
        
        if method == "POST" {
            request.httpBody = httpBody
        }
        
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if (response as? HTTPURLResponse) != nil {
                guard let data = data, error == nil else {
                    return
                }
                completion( try! self.newJSONDecoder().decode(T.self, from: data), nil)
                
            }
        }.resume()
        
    }
    
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }

    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
    
   func getPopular(completion: @escaping (ResponsePopular?, Error?) -> Void) -> Void {
        httpRequest(endpoint: "/movie/popular", method: "GET", completion: completion)
    }
    
    func getTopRated( completion: @escaping (ResponseTopRated?, Error?) -> Void) -> Void {
        httpRequest(endpoint: "/movie/top_rated", method: "GET", completion: completion)
    }
    
    func getDetail(_ id:String, completion: @escaping (ResponseDetail?, Error?) -> Void) -> Void {
        httpRequest(endpoint: "/movie/"+id, method: "GET", completion: completion)
    }
    
}
