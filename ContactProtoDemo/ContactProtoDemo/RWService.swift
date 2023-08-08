//
//  RWService.swift
//  PetDemo
//
//  Created by henry on 2023/8/8.
//

import Foundation

class RWService {
    static let shared = RWService()
    let url = "http://127.0.0.1:5000"
    
    private init() { }
    
    func getCurrentUser(_ completion: @escaping (Contact?) -> ()) {
        let path = "/currentUser"
        let url = URL(string: "\(url)\(path)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                completion(nil)
                return
            }
            if let data = data {
                let contact = try? Contact(serializedData: data)
                completion(contact)
            }
        }
        task.resume()
    }
}
