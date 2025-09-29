//
//  CategoryViewCell.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit
import NextPatchGame

class CategoryViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var genres: [GenreEntity] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

extension CategoryViewCell {
    private func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GenresViewCell", bundle: nil), forCellWithReuseIdentifier: "GenresViewCell")
    }
    
    func updateData(with genresData: [GenreEntity]) {
        genres = genresData
        collectionView.reloadData()
    }
}

extension CategoryViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresViewCell", for: indexPath) as? GenresViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: genres[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
