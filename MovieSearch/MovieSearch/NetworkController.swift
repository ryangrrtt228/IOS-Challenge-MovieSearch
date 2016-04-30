//
//  NetworkController.swift
//  MovieSearch
//
//  Created by Batman on 4/28/16.
//  Copyright © 2016 Batman. All rights reserved.
//
import Foundation
import UIKit

class NetworkController {
    
    static func baseURL(searchTerm:String) -> NSURL {
        let modifiedSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
        return NSURL(string: "http://api.themoviedb.org/3/search/movie?query=\(modifiedSearchTerm)&api_key=68a8779098e355ac704c413416c684af")!
    }
    
    static func popularURL() -> NSURL {
        return NSURL(string: "http://api.themoviedb.org/3/movie/popular?api_key=68a8779098e355ac704c413416c684af")!
        
    }
    
    
    static func imageForDataAtEndpoint(movie: Movie, completion: (poster: UIImage ) -> Void) {
        if let url = NSURL(string: "http://image.tmdb.org/t/p/w500/\(movie.poster)") {
            NetworkController.dataAtURL(url) { (data) in
                if let data = data {
                    if let poster = UIImage(data: data) {
                        completion(poster: poster)
                    }
                }
            }
        }
        
    }

    
    static func dataAtURL(url:NSURL, completion:(resultData:NSData?) -> Void){
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
    
    
    
}

