//
//  CacheManager.swift
//  RestApp
//
//  Created by Kate on 23/10/2023.
//


import Foundation
import Alamofire
import AlamofireImage

final class CacheManager {
    
    private init() {}
    
    static let shared = CacheManager()
    
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: 100_000_000,
        preferredMemoryUsageAfterPurge: 60_000_000
    )
    
}
