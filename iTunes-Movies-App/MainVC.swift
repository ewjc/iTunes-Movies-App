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
        print("movies have been successfully loaded")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.toMovieDetailedVC {
            let destinationVC = segue.destination as! MovieDetailedVC
            let moviesArray = iTunesAPI.moviesArray[(tableView.indexPathForSelectedRow?.row)!]
            
            destinationVC.movieTitleLabel.text = moviesArray.movieTitle
            destinationVC.moviePriceLabel.text = moviesArray.moviePrice
            destinationVC.releaseDateLabel.text = moviesArray.movieReleaseDate

            // Fix unwrap nil
        }
    }
    
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // View Did Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        iTunesAPI.delegate = self
        iTunesAPI.requestMovieAPI()
        iTunesAPI.moviesArray = []
    }
    
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


















