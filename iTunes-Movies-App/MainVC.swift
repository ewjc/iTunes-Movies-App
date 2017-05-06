//
//  ViewController.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/2/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import UIKit

class MainVC: UIViewController, iTunesMovieDelegate {
    
    // Properties
    var iTunesAPI = MovieAPI()

    
    // Functions
    func didLoadMovies() {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.toMovieDetailedVC {
            
            
            if let destinationVC = segue.destination as? MovieDetailedVC {
                
                var moviesArray = iTunesAPI.moviesArray
                let indexPath = tableView.indexPathForSelectedRow?.row
                let selectedMovie = moviesArray[indexPath!]
                
                
                destinationVC.movieTitle = selectedMovie.movieTitle
                destinationVC.moviePrice = selectedMovie.moviePrice
                destinationVC.movieReleaseDate = selectedMovie.movieReleaseDate
                destinationVC.moviePosterUrl = selectedMovie.moviePosterUrl
                destinationVC.movieLink = selectedMovie.movieAppLink
            }
            
        }
    }
    
    
    // View Did Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        iTunesAPI.delegate = self
        iTunesAPI.requestMovieAPI()
        iTunesAPI.moviesArray = []
    }
    
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
}


// Table View Flow
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return iTunesAPI.moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.toMovieDetailedVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.movieCell) as! MovieTableViewCell
        
        let movieArray = iTunesAPI.moviesArray[indexPath.row]
        
        cell.movieTitleLabel.text = movieArray.movieTitle
        cell.moviePriceLabel.text = "Price: \(movieArray.moviePrice)"
        cell.releaseDateLabel.text = "Release Date: \(movieArray.movieReleaseDate)"
        
        return cell
    }

}



