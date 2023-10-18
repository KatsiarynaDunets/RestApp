//
//  CommentModel.swift
//  RestApp
//
//  Created by Kate on 18/10/2023.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String?
    let email: String?
    let body: String?
}

