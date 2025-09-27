//
//  GenresViewCell.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit
import SDWebImage

class GenresViewCell: UICollectionViewCell {

    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var genreImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension GenresViewCell {
    func configure(with genre: GenreEntity) {
        genreLbl.text = genre.name
        genreImg.sd_setImage(with: URL(string: genre.imageBackground))
    }
    
    func configureScrennshot(with data: DeveloperEntity?) {
        genreImg.sd_setImage(with: URL(string: data?.imageBackground ?? ""))
        genreLbl.text = ""
    }
    
    func configureTag(with data: DeveloperEntity?) {
        genreImg.sd_setImage(with: URL(string: data?.imageBackground ?? ""))
        genreLbl.text = data?.name ?? ""
    }
}
