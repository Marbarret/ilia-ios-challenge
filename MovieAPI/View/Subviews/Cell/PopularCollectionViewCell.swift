//
//  PopularCollectionViewCell.swift
//  MovieAPI
//
//  Created by Marcylene Barreto on 27/01/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "PopularCollectionViewCell"
    
    // MARK: - Outlet
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Methods
    func setupUI() {
        imageMovie.layer.cornerRadius = 10
    }
    
    func setupModel(_ movie: MoviesItens?) {
        guard let movieModel = movie else {return}
        movieTitle.text = movieModel.title
        
        guard let urlImage = movie?.poster_path else {return}
        if let url = URL(string: "https://image.tmdb.org/t/p/original\(urlImage)") {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                imageMovie.image = image
            }
        }
    }

}
