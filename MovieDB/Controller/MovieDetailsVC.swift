//
//  MovieDetailsVC.swift UIViewController that displays movie details
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-26.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var movieBanner: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var popularityScore: UILabel!
    @IBOutlet weak var releaseYear: UILabel!
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
    
    func setMovieInfoDetails(_ movieInfoDetails : MovieInfo?){
        guard let response = movieInfoDetails else { return }
        movieTitle.text = "Title \(response.movieTitle ?? "")"
        popularityScore.text = "Popularity Score \(response.popularityScore ?? "")"
        releaseYear.text = "Release \(response.releaseYear ?? "")"
        movieBanner.image = UIImage(systemName: response.banner ?? "popcorn")
        movieDescription.text = response.movieDescription
    }
}
