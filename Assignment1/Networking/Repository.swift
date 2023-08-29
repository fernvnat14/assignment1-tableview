//
//  GithubRepository.swift
//  Assignment1
//
//  Created by A667271 A667271 on 24/8/2566 BE.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let fullname: String
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullname = "full_name"
        case owner

    }
}

struct Owner: Decodable {
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}
