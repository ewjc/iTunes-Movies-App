//
//  MovieAPI.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/2/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import Foundation

class MovieAPI {
    
    func requestMovieAPI() {
        let urlString = Constants.itunesUrl
        let session = URLSession.shared
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                print(json)
            }
        }
    
        task.resume()
    }

}
