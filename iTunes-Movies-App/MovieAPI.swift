//
//  MovieAPI.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/2/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import Foundation

class MovieAPI {
    
    //Properties
    var movies = [Movie]()
    
    // Makes a read request to the url and parses through the information
    func requestMovieAPI() {
        let urlString = Constants.itunesUrl
        let session = URLSession.shared
        let url = URL(string: urlString)
        
        // Handles the task session
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let feed = json["feed"] as! NSDictionary
                let entry = feed["entry"] as! [AnyObject]
                
                // Goes through each movie in the entry array and appends relevant information
                for movie in entry {
                    
                    let movieId = movie as! NSDictionary
                    
                    // Gets the name
                    let name = movieId["im:name"] as! NSDictionary
                    
                    // Gets the release date
                    let releaseDateParent = movieId["im:releaseDate"] as! NSDictionary
                    let releaseAttributes = releaseDateParent["attributes"] as! NSDictionary
                    let releaseDate = releaseAttributes["label"]
                    
                    // Gets the price
                    let price = movieId["im:price"] as! NSDictionary
                    let priceUSD = price["label"] as! NSString
                    
                    // Gets URL to iTunes App
                    let linkParent = movieId["link"] as! NSArray
                    let linkArray = linkParent[0] as! NSDictionary
                    let linkAttributes = linkArray["attributes"] as! NSDictionary
                    let link = linkAttributes["href"] as! NSString
                    
                    
                    // Gets the poster
                    let imageParent = movieId["im:image"] as! NSArray
                    let imageObject = imageParent[2] as! NSDictionary
                    let imageUrl = imageObject["label"] as! NSString
                    
                    let movie = Movie(movieName: name as! String,
                                             movieReleaseDate: releaseDate as! String,
                                             moviePrice: priceUSD as! String,
                                             moviePosterUrl: imageUrl as! String,
                                             movieAppLink: link as! String)
                    
                    self.movies.append(movie)
                }
                
            }
        }
    
        task.resume()
    }

}
