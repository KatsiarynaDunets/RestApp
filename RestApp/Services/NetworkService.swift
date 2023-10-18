//
//  NetworkService.swift
//  RestApp
//
//  Created by Kate on 16/10/2023.
//

import Alamofire
import SwiftyJSON
import AlamofireImage
import UIKit

class NetworkService {
    static func deletePost(postID: Int, callback: @escaping (_ result: JSON?, _ error: Error?) -> ()) {
        
        let urlPath = "\(ApiConstants.postsPath)/\(postID)"
        
        AF.request(urlPath, method: .delete, encoding: JSONEncoding.default)
            .response { response in

                var jsonValue: JSON?
                var err: Error?

                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        callback(jsonValue, err)
                        return
                    }
                    jsonValue = JSON(data)
                case .failure(let error):
                    err = error
                }
                callback(jsonValue, err)
            }
    }
    
    static func fetchComments(postID: Int, callback: @escaping (_ result: [Comment]?, _ error: Error?) -> ()) {
        
        let urlPath = "\(ApiConstants.commentsPath)?postId=\(postID)"
        
        AF.request(urlPath, method: .get, encoding: JSONEncoding.default)
            .response { response in

                var value: [Comment]?
                var err: Error?

                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        callback(value, err)
                        return
                    }
                    print(JSON(data))
                    do {
                        value = try JSONDecoder().decode([Comment].self, from: data)
                    } catch (let decoderError) {
                        callback(value, decoderError)
                    }
                case .failure(let error):
                    err = error
                }
                callback(value, err)
            }
    }
    
    static func fetchAlbums(userID: Int, callback: @escaping (_ result: [Album]?, _ error: Error?) -> ()) {
        
        let urlPath = "\(ApiConstants.albumsPath)?userId=\(userID)"
        
        AF.request(urlPath, method: .get, encoding: JSONEncoding.default)
            .response { response in

                var value: [Album]?
                var err: Error?

                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        callback(value, err)
                        return
                    }
                    do {
                        value = try JSONDecoder().decode([Album].self, from: data)
                    } catch (let decoderError) {
                        callback(value, decoderError)
                    }
                case .failure(let error):
                    err = error
                }
                callback(value, err)
            }
    }
    
    static func fetchPhotos(albumID: Int, callback: @escaping (_ result: [Photo]?, _ error: Error?) -> ()) {
        
        let urlPath = "\(ApiConstants.photosPath)?albumId=\(albumID)"
        
        AF.request(urlPath, method: .get, encoding: JSONEncoding.default)
            .response { response in

                var value: [Photo]?
                var err: Error?

                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        callback(value, err)
                        return
                    }
                    do {
                        value = try JSONDecoder().decode([Photo].self, from: data)
                    } catch (let decoderError) {
                        callback(value, decoderError)
                    }
                case .failure(let error):
                    err = error
                }
                callback(value, err)
            }
    }
    
    static func getThumbnail(thumbnailURL: String, callback: @escaping (_ result: UIImage?, _ error: AFError?) -> ()) {
        AF.request(thumbnailURL).responseImage { response in
            switch response.result {
                case .success(let image): callback(image, nil)
                case .failure(let error): callback(nil, error)
            }
        }
    }
}
