//
//  NetworkManager.swift
//  testCommitGitHub
//
//  Created by Evgenyi on 5/14/21.
//

import Foundation


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

