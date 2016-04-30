//
//  ResultsCollectionViewController.swift
//  MovieSearch
//
//  Created by Batman on 4/28/16.
//  Copyright © 2016 Batman. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCollectionCell"

class ResultsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   var filterMoives:[Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return filterMoives.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MovieCollectionViewCell
    
        // Configure the cell
        let movie = filterMoives[indexPath.row]
        cell.updateCellWithMovie(movie)
    
        return cell
    }
    
    // MARK: - flow 
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2 - 1, height: self.view.frame.height/2 - 1)
    }


}
