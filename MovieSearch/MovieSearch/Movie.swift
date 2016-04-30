//
//  Movie.swift
//  MovieSearch
//
//  Created by Batman on 4/28/16.
//  Copyright © 2016 Batman. All rights reserved.
//
import Foundation


class Movie {
    
    let title: String
    let rating: Float
    let summary: String
    let poster: String
    
    init?(json:[String:AnyObject]) {
        guard let title = json["title"] as? String,
            let rating = json["vote_average"] as? Float,
            let poster = json["poster_path"] as? String,
            let summary = json["overview"] as? String where !summary.isEmpty else {
                self.title = ""
                self.summary = ""
                self.rating = 0
                self.poster = ""
                return nil
        }
        self.title = title
        self.summary = summary
        self.rating = rating
        self.poster = poster
    }
    
    
}