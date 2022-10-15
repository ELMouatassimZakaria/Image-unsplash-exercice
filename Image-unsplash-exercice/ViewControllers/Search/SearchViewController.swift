//
//  SearchViewController.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import UIKit
import UnsplashPhotoPicker

class SearchViewController: UIViewController {
    //MARK: - Properties
    var searchController: UISearchController!
    
    lazy var searchListVc : ResultsListViewController  = {
        var searchListVc = ResultsListViewController()
        searchListVc.viewModel = ResultsListViewModel(delegate: searchListVc)
        return searchListVc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        title = "Search"
        searchController = UISearchController(searchResultsController: searchListVc)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setUpNavigation() {
        navigationController?.navigationBar.barTintColor = .systemYellow.withAlphaComponent(0.2)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        let vc =  searchController.searchResultsController as? ResultsListViewController
        vc?.title = text
        if text.count > 3 {
            vc?.viewModel.fetchResults(query: text)
        }
    }
}
