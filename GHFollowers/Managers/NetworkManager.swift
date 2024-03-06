//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Mahmudul Hasan on 5/3/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username:String, page: Int, completed: @escaping ([Followers]?, String) -> Void) {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(nil, "Invalid username, please try again")
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(nil, "Unable to completed the request, please check your internet connection")
                
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server, please try again")
                
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again")
                
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Followers].self, from: data)
                completed(followers, "No Error")
            }
            catch {
                completed(nil, "The data received from the server was invalid. Please try again")
            }
        }
        
       
        
        task.resume()
    }
    
   
    
}
