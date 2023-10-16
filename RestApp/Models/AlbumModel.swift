//
//  AlbumModel.swift
//  RestApp
//
//  Created by Kate on 16/10/2023.
//

import Foundation

struct Album: Codable {
    let userId: Int
    let id: Int
    let title: String?
}
