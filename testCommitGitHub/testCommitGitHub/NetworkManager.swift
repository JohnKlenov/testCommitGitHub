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


