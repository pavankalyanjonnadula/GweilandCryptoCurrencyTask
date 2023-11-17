//
//  ApiClient.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 16/11/23.
//

import Foundation


class ApiClient  {
    static let shared = ApiClient()
    
    func getRequest<T:Codable>(url : String ,handler: @escaping (T?,Error?) -> ()) {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("2d3fe90d-ac7c-4a1e-8759-2283d7a00718", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
         
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                handler(nil,error)
                return
            }
            if let jsonData = data{
                let jsonDecoder = JSONDecoder()
                do{
//                    let dixii = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String : Any]
//                    print(dixii)
                    let modelJson : T = try jsonDecoder.decode(T.self, from: jsonData)

                    handler(modelJson,nil)
                }catch{
                    handler(nil,error)
                }
            }
        }
        task.resume()
    }
}

