//
//  Movie.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/2/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import Foundation

class Movie {
    var movieName: String?
    var movieReleaseDate: String?
    var moviePrice: String?
    var moviePosterUrl: String?
    var movieAppLink: String?

    init(movieName: String, movieReleaseDate: String, moviePrice: String, moviePosterUrl: String, movieAppLink: String) {
        self.movieName = movieName
        self.movieReleaseDate = movieReleaseDate
        self.moviePrice = moviePrice
        self.moviePosterUrl = moviePosterUrl
        self.movieAppLink = movieAppLink
    }

}
