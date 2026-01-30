//
//  MovieDetailsVC.swift UIViewController that displays movie details
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-29.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    //MARK: Properties
    var receivedMovieInfoResponse: MovieInfo?
    
    var movieBanner: UIImageView?
    var movieTitle: UILabel?
    var movieDescription: UITextView?
    var popularityScore: UILabel?
    var releaseYear: UILabel?
    var ratings: UILabel?
    var genreId: UILabel?
    var voteCount: UILabel?

    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = ViewControllerScreenTitles.MovieDetails.rawValue
        setUpUI()
        setMovieInfoDetails(receivedMovieInfoResponse)
    }
}

// MARK: Setup UI

extension MovieDetailsVC{
    func setUpUI(){
        movieBanner = UIImageView()
        movieBanner?.translatesAutoresizingMaskIntoConstraints = false
        
        movieTitle = UILabel()
        movieTitle?.textAlignment = .center
        movieTitle?.textColor = .black
        movieTitle?.translatesAutoresizingMaskIntoConstraints = false
        
        movieDescription = UITextView()
        movieDescription?.textAlignment = .center
        movieDescription?.textColor = .black
        movieDescription?.translatesAutoresizingMaskIntoConstraints = false
        
        popularityScore = UILabel()
        popularityScore?.textAlignment = .center
        popularityScore?.textColor = .black
        popularityScore?.translatesAutoresizingMaskIntoConstraints = false
        
        releaseYear = UILabel()
        releaseYear?.textAlignment = .center
        releaseYear?.textColor = .black
        releaseYear?.translatesAutoresizingMaskIntoConstraints = false
        
        ratings = UILabel()
        ratings?.textAlignment = .center
        ratings?.textColor = .black
        ratings?.translatesAutoresizingMaskIntoConstraints = false
        
        genreId = UILabel()
        genreId?.textAlignment = .center
        genreId?.textColor = .black
        genreId?.translatesAutoresizingMaskIntoConstraints = false
        
        voteCount = UILabel()
        voteCount?.textAlignment = .center
        voteCount?.textColor = .black
        voteCount?.translatesAutoresizingMaskIntoConstraints = false
        
        if let movieBanner = movieBanner, let movieDescription = movieDescription, let movieTitle = movieTitle, let popularityScore = popularityScore, let releaseYear = releaseYear, let ratings = ratings, let genreId = genreId, let voteCount = voteCount{
                view.addSubview(movieBanner)
                view.addSubview(movieTitle)
                view.addSubview(movieDescription)
                view.addSubview(popularityScore)
                view.addSubview(releaseYear)
                view.addSubview(ratings)
                view.addSubview(genreId)
                view.addSubview(voteCount)
            
                NSLayoutConstraint.activate([
                    movieTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
                    movieTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
                    movieBanner.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20),
                    movieBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    movieBanner.widthAnchor.constraint(equalToConstant: 100),
                    movieBanner.heightAnchor.constraint(equalToConstant: 100),
                    
                    movieDescription.topAnchor.constraint(equalTo: movieBanner.bottomAnchor, constant: 30),
                    movieDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    movieDescription.widthAnchor.constraint(equalToConstant: 200),
                    movieDescription.heightAnchor.constraint(equalToConstant: 200),
                    
                    popularityScore.topAnchor.constraint(equalTo: movieDescription.bottomAnchor, constant: 50),
                    popularityScore.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                    releaseYear.topAnchor.constraint(equalTo: popularityScore.bottomAnchor, constant: 20),
                    releaseYear.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
                    ratings.topAnchor.constraint(equalTo: releaseYear.bottomAnchor, constant: 20),
                    ratings.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
                    genreId.topAnchor.constraint(equalTo: ratings.bottomAnchor, constant: 20),
                    genreId.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
                    voteCount.topAnchor.constraint(equalTo: genreId.bottomAnchor, constant: 20),
                    voteCount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        }
    }
}

// MARK: Setter Methods

extension MovieDetailsVC{
    
    //Method to set movie details from response
    func setMovieInfoDetails(_ movieInfoDetails : MovieInfo?){
        guard let response = movieInfoDetails else { return }
        movieTitle?.text = "Title: \(response.movieTitle ?? "")"
        popularityScore?.text = "Popularity Score: \(response.popularityScore ?? "")"
        releaseYear?.text = "Release: \(response.releaseYear ?? "")"
        movieBanner?.image = UIImage(systemName: response.banner ?? "popcorn")
        movieDescription?.text = response.movieDescription
        genreId?.text = "Genre Ids: \(response.genreIds ?? "")"
        voteCount?.text = "Vote Count: \(response.voteCount ?? "")"
        ratings?.text = "Ratings: \(response.ratings ?? "")"
    }
}
