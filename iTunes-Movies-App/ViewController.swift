//
//  ViewController.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/2/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var iTunesAPI = MovieAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        iTunesAPI.requestMovieAPI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

