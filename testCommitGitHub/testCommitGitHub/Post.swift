//
//  Post.swift
//  testCommitGitHub
//
//  Created by Evgenyi on 5/14/21.
//

import Foundation


class Post:Codable {
    
    var userId:Int
    var id:Int
    var title:String
    var body:String
    
    init(userId:Int, title:String, body:String) {
        self.userId = userId
        self.title = title
        self.body = body
        self.id = 0
    }
}
