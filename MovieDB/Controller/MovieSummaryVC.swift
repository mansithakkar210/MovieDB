//
//  ViewController.swift
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-26.
//

import UIKit

class MovieSummaryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var movieSummaryTV: UITableView!
    var objMovieSummaries: [MovieInfo]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieSummaryTV.dataSource = self
        movieSummaryTV.delegate = self
        let m1 = MovieInfo(banner: "movieclapper", movieTitle: "Ad Astra", popularityScore: "176.614", releaseYear: "2019", ratings: "", voteCount: "0", genreIds: "", movieDescription: "This is action movie")
        let m2 = MovieInfo(banner: "popcorn", movieTitle: "Zatura: A Space Adventure", popularityScore: "161.547", releaseYear: "2005", ratings: "", voteCount: "0", genreIds: "", movieDescription: "This is action movie")
        let m3 = MovieInfo(banner: "movieclapper.fill", movieTitle: "Hamilton", popularityScore: "143.114", releaseYear: "2020", ratings: "", voteCount: "0", genreIds: "", movieDescription: "This is action movie")
        let m4 = MovieInfo(banner: "popcorn.fill", movieTitle: "Eurovision Song Contest: The story of firesaga", popularityScore: "138.944", releaseYear: "2020", ratings: "", voteCount: "0", genreIds: "", movieDescription: "This is action movie")
        objMovieSummaries?.append(m1)
        objMovieSummaries?.append(m2)
        objMovieSummaries?.append(m3)
        objMovieSummaries?.append(m4)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objMovieSummaries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieSummaryCell") as? MovieSummaryCell
        let movie = objMovieSummaries?[indexPath.row]
        cell?.movieTitle.text = movie?.movieTitle
        cell?.popularityScore.text = movie?.popularityScore
        cell?.releaseYear.text = movie?.releaseYear
        cell?.banner.image = UIImage(systemName: movie?.banner ?? "movieclapper")
        //cell?.popularityScore.text = "\(movie?.popularityScore)"
        //cell?.releaseYear.text = "\(movie?.releaseYear)"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let objMovieDetailsVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailsVC") as? MovieDetailsVC
        
        let movie = objMovieSummaries?[indexPath.row]
        
        objMovieDetailsVC?.receivedMovieInfoResponse = movie
        
        if let movieDetailsVC = objMovieDetailsVC {
            self.navigationController?.pushViewController(movieDetailsVC, animated: true)
        }
        
//        let movieDetailsVC = objMovieDetailsVC()
//        {
//            self.navigationController?.pushViewController(movieDetailsVC, animated: true)
//        }
    }
}

