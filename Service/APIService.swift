//
//  APIService.swift
//  ListProduct
//
//  Created by Wahid on 21/07/22.
//

import Foundation

class APIService {
    
    let BASE_URL : String = "https://recruitment.dev.rollingglory.com/api/"
    
    func getProducts(completion : @escaping ((ProductsResponse?) -> Void)) {
        guard let url = URL(string: "\(BASE_URL)v2/gifts?page[number]=1&page[size]=6") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                let result = try? decoder.decode(ProductsResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }.resume()
        
    }
    
    func getDetailProducts(id:Int, completion: @escaping ((ProductDetailResponse?) -> Void)) {
            guard let url   = URL(string: "\(BASE_URL)v2/gifts?page[number]=1&page[size]=6") else {
                fatalError("URL is not correct")
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let response = response as? HTTPURLResponse, let data = data else { return }
                
                if response.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let result = try? decoder.decode(ProductDetailResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(result)
                    }
                } else {
                    print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                }
            }.resume()
        }
    
    func getImage(completion: @escaping ((ProductImageResponse?) -> Void)) {
            guard let url   = URL(string: "\(BASE_URL)v2/gifts?page[number]=1&page[size]=6") else {
                fatalError("URL is not correct")
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let response = response as? HTTPURLResponse, let data = data else { return }
                
                if response.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let result = try? decoder.decode(ProductImageResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(result)
                    }
                } else {
                    print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                }
            }.resume()
        }
}
