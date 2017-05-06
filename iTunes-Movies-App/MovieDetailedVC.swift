//
//  MovieDetailedVC.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/3/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import UIKit

class MovieDetailedVC: UIViewController {

    // Properties
    var movieTitle: String?
    var moviePrice: String?
    var movieReleaseDate: String?
    var moviePosterUrl: String?
    var movieLink: String?
    
    
    // Functions
    func getImage(moviePosterUrl: String) {
        
        let urlString = moviePosterUrl
        let session = URLSession.shared
        let url = URL(string: urlString)
        
        let dataTask = session.dataTask(with: url!, completionHandler: { (data: Data?, URLResponse: URLResponse?, error: Error?) in
            if let data = data {
                
                DispatchQueue.main.async(execute: {
                    self.moviePosterImageView.image = UIImage(data: data)
                })
            }
        })
        
        dataTask.resume()
    }
    
    func goToUrl(movieLink: String) {
        let url = URL(string: movieLink)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("The application has successfull opened the app")
            })
        }
    }
    
    
    // View Did Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movieTitle = movieTitle, let moviePrice = moviePrice, let movieReleaseDate = movieReleaseDate, let moviePosterUrl = moviePosterUrl else { return }
        
        movieTitleLabel.text = movieTitle
        moviePriceLabel.text = "Price: \(moviePrice)"
        releaseDateLabel.text = "Release Date: \(movieReleaseDate)"
        
        // Displays the imageview from the URL
        getImage(moviePosterUrl: moviePosterUrl)
        
    }
    
    
    // IBOutlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    
    
    // IBActions
    @IBAction func moreInfoButtonTapped(_ sender: UIButton) {
        
        guard let movieLink = movieLink else { return }
        
        // Redirects user towards safari page
        self.goToUrl(movieLink: movieLink)
        print(movieLink)
    }
}
