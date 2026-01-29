//
//  MovieDetailsVC.swift UIViewController that displays movie details
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-26.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    // MARK: Outlets
    
    //Outlet UILabel to dispaly Movie Ratings
    @IBOutlet weak var ratings: UILabel!
    
    //Outlet UILabel to dispaly Movie Genre
    @IBOutlet weak var genreId: UILabel!
    
    //Outlet UILabel to dispaly Movie Vote Count
    @IBOutlet weak var voteCount: UILabel!
    
    //Outlet UILabel to dispaly Movie Banner image
    @IBOutlet weak var movieBanner: UIImageView!
    
    //Outlet UILabel to dispaly Movie Title
    @IBOutlet weak var movieTitle: UILabel!
    
    //Outlet UILabel to dispaly Movie Description
    @IBOutlet weak var movieDescription: UITextView!
    
    //Outlet UILabel to dispaly movie Popularity Score
    @IBOutlet weak var popularityScore: UILabel!
    
    //Outlet UILabel to dispaly movie rRelease Year
    @IBOutlet weak var releaseYear: UILabel!
    
    //MARK: Properties
    
    var receivedMovieInfoResponse: MovieInfo?

    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ViewControllerScreenTitles.MovieDetails.rawValue
        setMovieInfoDetails(receivedMovieInfoResponse)
    }
}

// MARK: Setter Methods

extension MovieDetailsVC{
    
    //Method to set movie details from response
    func setMovieInfoDetails(_ movieInfoDetails : MovieInfo?){
        guard let response = movieInfoDetails else { return }
        movieTitle.text = "Title: \(response.movieTitle ?? "")"
        popularityScore.text = "Popularity Score: \(response.popularityScore ?? "")"
        releaseYear.text = "Release: \(response.releaseYear ?? "")"
        movieBanner.image = UIImage(systemName: response.banner ?? "popcorn")
        movieDescription.text = response.movieDescription
        genreId.text = "Genre Ids: \(response.genreIds ?? "")"
        voteCount.text = "Vote Count: \(response.voteCount ?? "")"
        ratings.text = "Ratings: \(response.ratings ?? "")"
    }
}
