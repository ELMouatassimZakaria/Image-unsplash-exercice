//
//  ResultsListViewController.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import Foundation

import UIKit

class ResultsListViewController: SearchViewController {
    
    //MARK: Outlets
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //MARK: Proprties
    var viewModel: ResultsListViewModel!
    let KcellHeigh: CGFloat = 212
    let KCellIdentifier = "PhotosCell"
    var query: String = ""

    public var items: [Result] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.resultsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        spinner.hidesWhenStopped = true
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "\(PhotosViewCell.self)", bundle: nil)
        resultsTableView.register(nib, forCellReuseIdentifier: KCellIdentifier)
    }
}
