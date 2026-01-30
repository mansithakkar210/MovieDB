//
//  MovieSummaryVC.swift UIViewController that displays movie summary data
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-29.
//

import UIKit

class MovieSummaryVC: UIViewController{
    
    // MARK: Properties
    
    var movieSummaryTV: UITableView?
    var objMovieSummaries: [MovieInfo]? = []
    
    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = ViewControllerScreenTitles.MovieSummary.rawValue
        setUpTableView()
        objMovieSummaries = MovieInfo.getMockData()
    }
}

// MARK: SetUp TableView
extension MovieSummaryVC: UITableViewDataSource, UITableViewDelegate{
    func setUpTableView(){
        movieSummaryTV = UITableView()
        movieSummaryTV?.translatesAutoresizingMaskIntoConstraints = false
        if let movieSummaryTV{
            view.addSubview(movieSummaryTV)
            NSLayoutConstraint.activate([
                movieSummaryTV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                movieSummaryTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                movieSummaryTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                movieSummaryTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            ])
        }
        movieSummaryTV?.dataSource = self
        movieSummaryTV?.delegate = self
        movieSummaryTV?.register(MovieSummaryCell.self, forCellReuseIdentifier: "MovieSummaryCell")
    }
}

// MARK: Table View DataSource Methods

extension MovieSummaryVC{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objMovieSummaries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.MovieSummaryCell.rawValue) as? MovieSummaryCell
        
        let movie = objMovieSummaries?[indexPath.row]
        
        cell?.setMovieSummaryDetails(movie)
        
        print(movie?.movieTitle)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let movieTitleLabel = UILabel(frame: CGRect(x: 90, y: 0, width: 90, height: 90))
        movieTitleLabel.text = "The Movies"
        movieTitleLabel.textAlignment = .center
        
        return movieTitleLabel
    }
}

// MARK: Table View Delegate Methods

extension MovieSummaryVC{
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = objMovieSummaries?[indexPath.row]
        
        let objMovieDetailsVC = MovieDetailsVC()
        
        objMovieDetailsVC.receivedMovieInfoResponse = movie
        
        self.navigationController?.pushViewController(objMovieDetailsVC, animated: true)
    }
}

