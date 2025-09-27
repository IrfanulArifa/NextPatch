//
//  FavoriteViewController.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 04/08/25.
//

import UIKit

class FavoriteViewController: UIViewController {
    private var viewModel: FavoriteViewModels!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        setupDependencies()
        setupViewModel()
        loadData()
    }

}

extension FavoriteViewController {
    func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionCell")
    }
    
    func setupDependencies() {
        viewModel = DependencyInjection.shared.container.resolve(FavoriteViewModels.self)!
    }
    
    func setupViewModel() {
        viewModel.$gameData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                self.collectionView.reloadData()
            }
            .store(in: &viewModel.cancellables)
    }
    
    func loadData() {
        viewModel.getFavoriteGames()
    }
}

extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.gameData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionCell", for: indexPath) as? CardCollectionCell else { return UICollectionViewCell() }
        cell.configureWithFavData(data: viewModel.gameData[indexPath.item])
        
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
        let vc = DetailTrayViewController()
        vc.gameId = Int(viewModel.gameData[indexPath.item].id)
        vc.gameName = viewModel.gameData[indexPath.item].name
        vc.modalPresentationStyle = .overCurrentContext
        vc.dismiss = {
            self.loadData()
        }
        present(vc, animated: false)
    }
    
}
