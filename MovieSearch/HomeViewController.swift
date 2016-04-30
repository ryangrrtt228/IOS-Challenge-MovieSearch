//
//  HomeViewController.swift
//  MovieSearch
//
//  Created by Batman on 4/28/16.
//  Copyright © 2016 Batman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    var results: [Movie]?
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchController()

        MovieController.searchForPopularMovies { (movieArray) -> Void in
            if let movies = movieArray {
                self.results = movies
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableview.reloadData()
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return results?.count ?? 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieTableCell", forIndexPath: indexPath)
        // update the cell according to our moviearray
        
        if let movies = results {
            let movie = movies[indexPath.row]
            cell.textLabel?.text = movie.title
            cell.detailTextLabel?.text = movie.summary
        }
        
        
        return cell
    }
}


extension HomeViewController: UISearchResultsUpdating {
    
   
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print("searchResultsUpdating")
        let searchTerm = searchController.searchBar.text!.lowercaseString
        
        MovieController.searchForMovies(searchTerm) { (movieArray) -> Void in
            if let movies = movieArray {
                if let resultController = searchController.searchResultsController as? ResultsCollectionViewController {
                    resultController.filterMoives = movies
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        resultController.collectionView?.reloadData()
                    })
                }
            }
        }
    }
    
    func setUpSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsCollectionVC")
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Search Movie titles..."
        
        tableview.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
    }
    
}
