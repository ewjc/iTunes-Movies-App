//
//  Movie.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/2/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import Foundation

class Movie {
    var movieTitle: String
    var movieReleaseDate: String
    var moviePrice: String
    var moviePosterUrl: String
    var movieAppLink: String

//    func convertToDictionary() -> [String: String] {
//        var dictionary = [String: String]()
//        
//        dictionary["title"] = movieTitle
//        dictionary["releasedate"] = movieReleaseDate
//        dictionary["price"] = moviePrice
//        dictionary["poster"] = moviePosterUrl
//        dictionary["link"] = movieAppLink
//    
//        return dictionary
//    }
    
    init(movieTitle: String, movieReleaseDate: String, moviePrice: String, moviePosterUrl: String, movieAppLink: String) {
        self.movieTitle = movieTitle
        self.movieReleaseDate = movieReleaseDate
        self.moviePrice = moviePrice
        self.moviePosterUrl = moviePosterUrl
        self.movieAppLink = movieAppLink
    }
    
//    init(dictionary: [String : String]) {
//        self.movieTitle = dictionary["title"]!
//        self.movieReleaseDate = dictionary["releasedate"]!
//        self.moviePrice = dictionary["price"]!
//        self.moviePosterUrl = dictionary["url"]!
//        self.movieAppLink = dictionary["link"]!
//        
//    }
}
