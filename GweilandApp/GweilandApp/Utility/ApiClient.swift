//
//  ApiClient.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 16/11/23.
//

import Foundation
import UIKit

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

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
