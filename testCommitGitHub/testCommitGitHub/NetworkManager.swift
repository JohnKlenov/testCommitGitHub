//
//  NetworkManager.swift
//  testCommitGitHub
//
//  Created by Evgenyi on 5/14/21.
//

import Foundation

class NetworkManager {
    

    enum HTTPMethod:String {
    case POST
    case GET
    case DELETE
    case PUT
}

enum APIs:String {
    case posts
    case users
    case comments
}


private var baseURL = "https://jsonplaceholder.typicode.com/"


func getAllPosts(_ complitionHandler: @escaping ([Post]) -> Void) {
    guard let url = URL(string: baseURL+APIs.posts.rawValue) else {return}
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print("error getAllPosts")
        } else {
            if let respServer = response as? HTTPURLResponse,
               respServer.statusCode == 200,
               let data = data {
                if let post = try? JSONDecoder().decode([Post].self, from: data) {
                    complitionHandler(post)
                    }
                }
            }
        }.resume()
    }

    
    func postCreate(post:Post,_ comlitionHandler: @escaping (Post)-> Void) {
        guard let url = URL(string: baseURL + APIs.posts.rawValue),
              let data = try? JSONEncoder().encode(post) else {return}
        
        let request = MutableURLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        request.httpBody = data
        request.setValue("\(data.count)", forHTTPHeaderField: "Content-Lengh")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print("error postCreate")
            } else {
                if let respServer = response as? HTTPURLResponse,
                   respServer.statusCode == 201,
                   let data = data {
                    if let postServer = try? JSONDecoder().decode(Post.self, from: data) {
                        comlitionHandler(postServer)
                    }
                }
            }
        }.resume()
    }
    
}
