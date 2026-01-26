//
//  MovieDetailsVC.swift
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-26.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    @IBOutlet weak var movieBanner: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var popularityScore: UILabel!
    @IBOutlet weak var releaseYear: UILabel!
    var receivedMovieInfoResponse: MovieInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let response = receivedMovieInfoResponse else { return }
        movieTitle.text = "Title \(response.movieTitle ?? "")"
        popularityScore.text = "Popularity Score \(response.popularityScore ?? "")"
        releaseYear.text = "Release \(response.releaseYear ?? "")"
        movieBanner.image = UIImage(systemName: response.banner ?? "popcorn")
        movieDescription.text = response.movieDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
