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
                self.moviePosterImageView.image = UIImage(data: data)
            }
        })
        dataTask.resume()
    }
    
    
    // View Did Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        movieTitleLabel.text = movieTitle
        moviePriceLabel.text = moviePrice
        releaseDateLabel.text = movieReleaseDate
        
        // Renders image from URL
        getImage(moviePosterUrl: moviePosterUrl!)
        print(moviePosterUrl)
    }
    
    
    // IBOutlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    
    
    // IBActions
    @IBAction func moreInfoButtonTapped(_ sender: UIButton) {
    }
}
