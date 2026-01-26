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
        let m1 = MovieInfo(banner: "movieclapper", movieTitle: "Ad Astra", popularityScore: "176.614", releaseYear: "2019", ratings: "", voteCount: "0", genreIds: "", movieDescription: "Ad Astra (2019) is a contemplative sci-fi drama about astronaut Roy McBride, who is sent on a mission across the solar system to uncover the source of mysterious energy surges threatening Earth, believed to be connected to his long-lost father’s failed deep-space expedition. As Roy travels from the Moon to Mars and beyond, the journey becomes as much emotional as physical, forcing him to confront isolation, suppressed feelings, and the cost of obsession, making the film a visually striking and introspective exploration of humanity, loneliness, and connection in space.")
        let m2 = MovieInfo(banner: "popcorn", movieTitle: "Zatura: A Space Adventure", popularityScore: "161.547", releaseYear: "2005", ratings: "", voteCount: "0", genreIds: "", movieDescription: "Zathura: A Space Adventure (2005) is a family-friendly sci-fi fantasy about two bickering brothers who discover a mysterious board game that launches their house into outer space. As they play, each turn brings real cosmic dangers—robot attacks, meteor showers, and alien encounters—forcing them to work together to survive. Blending humor, action, and heart, the film explores sibling rivalry, teamwork, and growing up, all wrapped in a fast-paced, imaginative space adventure. 🚀")
        let m3 = MovieInfo(banner: "movieclapper.fill", movieTitle: "Hamilton", popularityScore: "143.114", releaseYear: "2020", ratings: "", voteCount: "0", genreIds: "", movieDescription: "Hamilton is a groundbreaking musical by Lin-Manuel Miranda that tells the story of American Founding Father Alexander Hamilton through a bold mix of hip-hop, R&B, pop, and traditional show tunes. Following Hamilton’s rise from an orphaned immigrant to a key figure in the American Revolution and the first U.S. Secretary of the Treasury, the show explores ambition, legacy, love, political rivalry, and the cost of greatness, all performed by a diverse cast that reimagines history with modern energy and urgency.")
        let m4 = MovieInfo(banner: "popcorn.fill", movieTitle: "Eurovision Song Contest: The story of firesaga", popularityScore: "138.944", releaseYear: "2020", ratings: "", voteCount: "0", genreIds: "", movieDescription: "Eurovision Song Contest: The Story of Fire Saga (2020) is a musical comedy about Lars Erickssong and Sigrit Ericksdóttir, two lifelong friends from a small Icelandic town who dream of winning the Eurovision Song Contest. When an unexpected opportunity lands them a spot in the competition, their quirky duo Fire Saga faces fierce rivals, chaotic performances, and personal doubts on the road to Eurovision glory. Packed with over-the-top humor, catchy songs, and heartfelt moments, the film celebrates big dreams, self-belief, and the joy of loving music—no matter how ridiculous the journey gets. 🎤")
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
        
        cell?.movieTitle.text = "Title: \(movie?.movieTitle ?? "")"
        cell?.popularityScore.text = "PopularityScore: \(movie?.popularityScore ?? "")"
        cell?.releaseYear.text = "Release Year: \(movie?.releaseYear ?? "")"
        cell?.banner.image = UIImage(systemName: movie?.banner ?? "movieclapper")
        
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
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var movieTitleLabel = UILabel(frame: CGRect(x: 90, y: 0, width: 90, height: 90))
        movieTitleLabel.text = "The Movies"
        movieTitleLabel.textAlignment = .center
        return movieTitleLabel
    }
}

