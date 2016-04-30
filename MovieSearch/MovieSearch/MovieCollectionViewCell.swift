//
//  MovieCollectionViewCell.swift
//  MovieSearch
//
//  Created by Batman on 4/28/16.
//  Copyright © 2016 Batman. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    

    func updateCellWithMovie(movie:Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        summaryLabel.text = movie.summary
        //posterImageView.image = movie.poster
        
    }
    
}
