//
//  DetailTrayViewController.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

import UIKit

class DetailTrayViewController: BaseTrayViewController, BaseTrayDelegate {
    
    private var viewModel: DetailViewModels!

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var gameId: Int? = 0
    var gameName: String = ""
    var dismiss: (() -> Void)?
    
    override func viewDidLoad() {
        self.trayDelegate = self
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        setupDependencies()
        setupViewModel()
        setupApi()
    }
}

extension DetailTrayViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailTrayCell", bundle: nil), forCellReuseIdentifier: "DetailTrayCell")
        
        titleLbl.text = gameName
        
        onTapBackgroundView = {
            self.dismiss?()
        }
    }
    
    func setupDependencies() {
        viewModel = DependencyInjection.shared.container.resolve(DetailViewModels.self)!
    }
    
    func setupViewModel() {
        viewModel.$gameDetails
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                self.tableView.reloadData()
                
            }
            .store(in: &viewModel.cancellables)
    }
    
    func setupApi() {
        viewModel.fetchDetail(id: gameId ?? 0)
    }
    
    @objc
    private func btnCloseTapped () {
        dismissPage()
    }
}

extension DetailTrayViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTrayCell", for: indexPath) as? DetailTrayCell else { return UITableViewCell() }
        cell.configure(with: viewModel.gameDetails)
        cell.addToFavoriteTapped = { [weak self] data in
            guard let self else { return }
            
            viewModel.toggleFavorite(data: data)
            
            if viewModel.isFavorite(data: data) {
                cell.favImg.image = UIImage(systemName: "heart.fill")
                SuccessSnackBar.make(in: self.view, message: "Ditambahkan ke Favorite", duration: .lengthShort).show()
            } else {
                cell.favImg.image = UIImage(systemName: "heart")
                FailedSnackBar.make(in: self.view, message: "Dihapus dari Favorite", duration: .lengthShort).show()
            }
        }
        return cell
    }
}
