//
//  MovieSummaryVC.swift UIViewController that displays movie summary data
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-26.
//

import UIKit

class MovieSummaryVC: UIViewController{
    
    // MARK: Outlets
    
    @IBOutlet weak var movieSummaryTV: UITableView!
    
    // MARK: Properties
    
    var objMovieSummaries: [MovieInfo]? = []
    
    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ViewControllerScreenTitles.MovieSummary.rawValue
        movieSummaryTV.dataSource = self
        movieSummaryTV.delegate = self
        objMovieSummaries = MovieInfo.getMockData()
    }
}

// MARK: Table View DataSource Methods

extension MovieSummaryVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objMovieSummaries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.MovieSummaryCell.rawValue) as? MovieSummaryCell
        
        let movie = objMovieSummaries?[indexPath.row]
        
        cell?.setMovieSummaryDetails(movie)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var movieTitleLabel = UILabel(frame: CGRect(x: 90, y: 0, width: 90, height: 90))
        movieTitleLabel.text = "The Movies"
        movieTitleLabel.textAlignment = .center
        return movieTitleLabel
    }
}

// MARK: Table View Delegate Methods

extension MovieSummaryVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let objMovieDetailsVC = storyboard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.MovieDetails.rawValue) as? MovieDetailsVC
        
        let movie = objMovieSummaries?[indexPath.row]
        
        objMovieDetailsVC?.receivedMovieInfoResponse = movie
        
        if let movieDetailsVC = objMovieDetailsVC {
            self.navigationController?.pushViewController(movieDetailsVC, animated: true)
        }
    }
}

