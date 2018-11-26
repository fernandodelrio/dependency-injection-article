//
//  NetworkProvider.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

class NetworkProvider: Providable {
    func get<T: Codable>(_ type: T.Type, completion: @escaping (T?) -> Void) {
        let success = { (result: T?) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        let failure = {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
        guard let url = URL(string: baseUrl+route(for: type)) else {
            failure()
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                failure()
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            success(result)
        }
        task.resume()
    }
    
    func getImage(_ identifier: String, completion: @escaping (UIImage?) -> Void) {
        let success = { (result: UIImage?) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        let failure = {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
        guard let url = URL(string: identifier) else {
            failure()
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                failure()
                return
            }
            let image = UIImage(data: data)
            success(image)
        }
        task.resume()
    }
    
    private var baseUrl: String {
        let path = Bundle.main.path(forResource: "Endpoints", ofType: "plist") ?? ""
        let plist = NSDictionary(contentsOfFile: path)
        return plist?["BaseUrl"] as? String ?? ""
    }
    
    private func route<T: Codable>(for type: T.Type) -> String {
        switch type {
        case is Contact.Type:
            return "contact"
        default:
            return ""
        }
    }
}
