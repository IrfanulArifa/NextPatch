//
//  CardCollectionCell.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit
import Game

class CardCollectionCell: UICollectionViewCell {

    @IBOutlet weak var cardImg: UIImageView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardRating: UILabel!
    @IBOutlet weak var cardDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension CardCollectionCell {
    
    func configure(data: GameEntity) {
        cardImg.sd_setImage(with: URL(string: data.backgroundImage))
        cardImg.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cardTitle.text = data.name
        cardDate.text = formattedDate(from: data.released)
        cardRating.text = "\(data.rating) / \(data.ratingTop)"
        
    }
    
    func configureWithFavData(data: FavoriteGameData) {
        cardImg.sd_setImage(with: URL(string: data.backgroundImage))
        cardImg.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cardTitle.text = data.name
        cardDate.text = formattedDate(from: data.released)
        cardRating.text = "\(data.rating) / \(data.ratingTop)"
    }
    
    func formattedDate(from dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "id_ID")
            outputFormatter.dateFormat = "dd MMMM yyyy"
            return outputFormatter.string(from: date)
        } else {
            return dateString
        }
    }
}
