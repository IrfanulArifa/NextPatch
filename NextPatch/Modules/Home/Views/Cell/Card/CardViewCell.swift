//
//  CardViewCell.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit
import Game

class CardViewCell: UITableViewCell {

    @IBOutlet weak var lihatSemuaLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    private var data: [GameEntity] = []
    var detailTapped: ((Int, String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

extension CardViewCell {
    func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionCell")
    }
    
    func configure(with gameData: [GameEntity]) {
        data = gameData
        calculateHeight(count: data.count)
        collectionView.reloadData()
    }
    
    func calculateHeight(count data: Int) {
        let itemsPerRow = 2
        let totalItems = data
        let rows = CGFloat(ceil(Double(totalItems) / Double(itemsPerRow)))
        let width = (UIScreen.main.bounds.width - 52) / 2
        let cellHeight = width * 4 / 3
        let rowSpacing: CGFloat = 20
        let totalHeight = (cellHeight * rows) + (max(0, rows - 1) * rowSpacing) + 20
        collectionHeight.constant = totalHeight
        contentView.layoutIfNeeded()
    }
}

extension CardViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionCell", for: indexPath) as? CardCollectionCell else { return UICollectionViewCell() }
        cell.configure(data: data[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 52) / 2
        let height = width * 4 / 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 20, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailTapped?(data[indexPath.item].id, data[indexPath.item].name)
    }
    
}
