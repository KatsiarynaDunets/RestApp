//
//  PostModel.swift
//  RestApp
//
//  Created by Kate on 16/10/2023.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String?
    let body: String?
}
