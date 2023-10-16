//
//  NetworkService.swift
//  RestApp
//
//  Created by Kate on 16/10/2023.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

class NetworkService {
    static func deletePost(postId: Int, callback: @escaping () -> ()) {
           let urlPath = "\(ApiConstants.postsPath)/\(postId)"
            AF.request(urlPath, method: .delete, encoding: JSONEncoding.default)
            .response { response in
                callback()
        }
    }
}
