//
//  ApiConstatnts.swift
//  RestApp
//
//  Created by Kate on 16/10/2023.
//

import Foundation

struct ApiConstants {
    
        /// Local server path
        private static let serverPath = "http://localhost:3000/"
        /// Users
        private static let usersPath = serverPath + "users"
        static let usersURL = URL(string: usersPath)
        
        /// Posts
        static let postsPath = serverPath + "posts"
        static let postsURL = URL(string: postsPath)
        
        /// Comments
        static let commentsPath = serverPath + "comments"
        static let commentsURL = URL(string: commentsPath)
        
        /// ToDo-s
        /// Сами!!!
        
        /// Alboms
        static let albumsPath = serverPath + "albums"
        static let albumsURL = URL(string: albumsPath)
        
        /// Photos
        static let photosPath = serverPath + "photos"
        static let photosURL = URL(string: photosPath)
    }
