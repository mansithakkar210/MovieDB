//
//  MovieSummaryCell.swift
//  MovieDB
//
//  Created by Mansi Thakkar on 2026-01-29.
//

import UIKit

class MovieSummaryCell: UITableViewCell {

    // MARK: Properties
    
    var bannerImage: UIImage?
    var bannerImageName: String?
    var bannerImageView: UIImageView?
    var movieTitle: UILabel?
    var popularityScore: UILabel?
    var releaseYear: UILabel?
    
    //MARK: TableViewCell init method
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MovieSummaryCell{
    func setupUI(){
        
        //MARK: UI SetUp method
        
        bannerImageView = UIImageView()
        bannerImageView?.translatesAutoresizingMaskIntoConstraints = false
        
        movieTitle = UILabel()
        movieTitle?.textAlignment = .center
        movieTitle?.textColor = .black
        movieTitle?.translatesAutoresizingMaskIntoConstraints = false
        
        popularityScore = UILabel()
        popularityScore?.textAlignment = .center
        popularityScore?.textColor = .black
        popularityScore?.translatesAutoresizingMaskIntoConstraints = false
        
        releaseYear = UILabel()
        releaseYear?.textAlignment = .center
        releaseYear?.textColor = .black
        releaseYear?.translatesAutoresizingMaskIntoConstraints = false
        
        if let bannerImageView = bannerImageView, let movieTitle = movieTitle, let popularityScore = popularityScore, let releaseYear = releaseYear{
            
                //Adding subviews into view
                contentView.addSubview(movieTitle)
                contentView.addSubview(popularityScore)
                contentView.addSubview(releaseYear)
                contentView.addSubview(bannerImageView)
            
                NSLayoutConstraint.activate([
                    //Adding constraints for banner image
                    bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                    bannerImageView.widthAnchor.constraint(equalToConstant: 50),
                    bannerImageView.heightAnchor.constraint(equalToConstant: 50),
                
                    //Adding constraints for movie title
                    movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
                    movieTitle.leadingAnchor.constraint(equalTo: bannerImageView.trailingAnchor, constant: 15),
                    movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                    //Adding constraints for popularity score
                    popularityScore.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20),
                    popularityScore.leadingAnchor.constraint(equalTo: bannerImageView.trailingAnchor, constant: 15),
                    popularityScore.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                    //Adding constraints for release year
                    releaseYear.topAnchor.constraint(equalTo: popularityScore.bottomAnchor, constant: 20),
                    releaseYear.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                    releaseYear.leadingAnchor.constraint(equalTo: bannerImageView.trailingAnchor, constant: 15),
                    releaseYear.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
    }
}


extension MovieSummaryCell{
    
    // MARK: Setter Methods
    
    func setMovieSummaryDetails(_ movieInfo : MovieInfo?){
        bannerImageView?.image = UIImage(systemName: movieInfo?.banner ?? "popcorn.fill")
        movieTitle?.text = "Title: \(movieInfo?.movieTitle ?? "")"
        popularityScore?.text = "PopularityScore: \(movieInfo?.popularityScore ?? "")"
        releaseYear?.text = "Release Year: \(movieInfo?.releaseYear ?? "")"
    }
}
