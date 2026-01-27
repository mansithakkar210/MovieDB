//
//  MovieSummaryCell.swift
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-26.
//

import UIKit

class MovieSummaryCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var popularityScore: UILabel!
    @IBOutlet weak var releaseYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MovieSummaryCell{
    
    // MARK: Setter Methods
    
    func setMovieSummaryDetails(_ movieInfo : MovieInfo?){
        movieTitle.text = "Title: \(movieInfo?.movieTitle ?? "")"
        popularityScore.text = "PopularityScore: \(movieInfo?.popularityScore ?? "")"
        releaseYear.text = "Release Year: \(movieInfo?.releaseYear ?? "")"
        banner.image = UIImage(systemName: movieInfo?.banner ?? "movieclapper")
    }
}
