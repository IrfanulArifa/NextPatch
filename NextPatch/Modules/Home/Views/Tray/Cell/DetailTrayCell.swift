//
//  DetailTrayCell.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

import UIKit
import NextPatchGame

class DetailTrayCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var screenshotCollection: UICollectionView!
    @IBOutlet weak var tagCollection: UICollectionView!
    @IBOutlet weak var favImg: UIImageView!
    @IBOutlet weak var btnImg: UIButton!
    @IBOutlet weak var lblDesc: UILabel!
    private var gameData: GameDetailsEntity?
    
    var snackBarTapped: ((Bool) -> Void)?
    var addToFavoriteTapped: ((FavoriteGameData) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

extension DetailTrayCell {
    func setupUI() {
        screenshotCollection.delegate = self
        screenshotCollection.dataSource = self
        screenshotCollection.register(UINib(nibName: "GenresViewCell", bundle: nil), forCellWithReuseIdentifier: "GenresViewCell")
        tagCollection.delegate = self
        tagCollection.dataSource = self
        tagCollection.register(UINib(nibName: "GenresViewCell", bundle: nil), forCellWithReuseIdentifier: "GenresViewCell")
        
        btnImg.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
    }
    
    func configure(with data: GameDetailsEntity?) {
        guard let data else { return }
        gameData = data
        
        imageCell.sd_setImage(with: URL(string: data.backgroundImage))
        lblText.text = "Rating \(data.rating)"
        lblDesc.text = data.descriptionRaw
        
        if FavoriteGameManager.shared.isFavorite(id: Int64(data.id)) {
            favImg.image = UIImage(systemName: "heart.fill")
        } else {
            favImg.image = UIImage(systemName: "heart")
        }
    
        screenshotCollection.reloadData()
        tagCollection.reloadData()
    }
    
    @objc func addToFavorite() {
        guard let gameData else { return }
        let data = gameData.toFavoriteData()
        
        addToFavoriteTapped?(data)
    }
}

extension DetailTrayCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == screenshotCollection {
            return gameData?.genres.count ?? 0
        } else {
            return gameData?.tags.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresViewCell", for: indexPath) as? GenresViewCell else {
            return UICollectionViewCell()
        }
        if collectionView == screenshotCollection {
            cell.configureScrennshot(with: gameData?.genres[indexPath.item])
        } else {
            cell.configureTag(with: gameData?.tags[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
