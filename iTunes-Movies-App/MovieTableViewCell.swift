//
//  MovieTableViewCell.swift
//  iTunes-Movies-App
//
//  Created by Eric Wong on 5/3/17.
//  Copyright © 2017 Bridge Mobile. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
