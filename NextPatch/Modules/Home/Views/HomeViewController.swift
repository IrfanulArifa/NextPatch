//
//  HomeViewController.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 04/08/25.
//

import UIKit
import Combine
import NextPatchGame

class HomeViewController: UIViewController {
    private var viewModel: HomeViewModels!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerLoading: UIView!
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    private var homeSectionArray = ["Search", "Genres", "Recommended"]
    @Published private var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDependencies()
        setupViewModel()
        setupApi()
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    
}

extension HomeViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HeaderViewCell", bundle: nil), forCellReuseIdentifier: "HeaderViewCell")
        tableView.register(UINib(nibName: "CategoryViewCell", bundle: nil), forCellReuseIdentifier: "CategoryViewCell")
        tableView.register(UINib(nibName: "CardViewCell", bundle: nil), forCellReuseIdentifier: "CardViewCell")
        
        navigationItem.titleView = headerWithProfilePicture(width: UIScreen.main.bounds.width)
        
        containerLoading.isHidden = false
        indicatorLoading.startAnimating()
    }
    
    func setupDependencies() {
        viewModel = DependencyInjection.shared.container.resolve(HomeViewModels.self)!
    }
    
    func setupViewModel() {
        viewModel.$games
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                let section = IndexSet(integer: 2)
                self.tableView.reloadSections(section, with: .automatic)
            }
            .store(in: &viewModel.cancellables)
        viewModel.$genres
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.containerLoading.isHidden = true
                    self.indicatorLoading.stopAnimating()
                    self.tableView.reloadData()
                }
            }
            .store(in: &viewModel.cancellables)
        
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.viewModel.filterGames(by: text)
            }
            .store(in: &viewModel.cancellables)
    }
    
    func setupApi() {
        viewModel.fetchGames()
        viewModel.fetchGenres()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if homeSectionArray[indexPath.section] == "Search" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderViewCell", for: indexPath) as? HeaderViewCell else { return UITableViewCell() }
            cell.searchText = { [weak self] text in
                guard let self else { return }
                searchText = text
            }
            return cell
        } else if homeSectionArray[indexPath.section] == "Genres" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryViewCell", for: indexPath) as? CategoryViewCell else { return UITableViewCell() }
            cell.updateData(with: viewModel.genres)
            return cell
        } else if homeSectionArray[indexPath.section] == "Recommended" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardViewCell", for: indexPath) as? CardViewCell else { return UITableViewCell() }
            cell.configure(with: viewModel.games)
            cell.detailTapped = { [weak self] id, name in
                guard let self else { return }
                let vc = DetailTrayViewController()
                vc.gameId = id
                vc.gameName = name
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: false)
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
