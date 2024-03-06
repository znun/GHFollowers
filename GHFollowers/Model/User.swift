//
//  User.swift
//  GHFollowers
//
//  Created by Mahmudul Hasan on 5/3/24.
//

import Foundation

struct User: Codable {
    var login: String
    var avatar: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos:Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createAt: String
}
