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
    
    // IBOutlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    
    
    // IBActions
    @IBAction func moreInfoButtonTapped(_ sender: UIButton) {
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
        
    }
    
    
}
