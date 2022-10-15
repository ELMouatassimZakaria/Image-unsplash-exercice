//
//  ResultsListViewController+delegates.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import Foundation
import UIKit

extension ResultsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KCellIdentifier, for: indexPath) as! PhotosViewCell
        cell.setupCell(model: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KcellHeigh
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.dismiss(animated: false) { [weak self] in
            guard let strongSelf = self else { return }
            let detailsVC = DetailsViewController()
            let result = strongSelf.items[indexPath.row]
            detailsVC.viewModel = DetailsViewModel(result: result)
            strongSelf.presentingViewController?.navigationController?.pushViewController(detailsVC, animated:true)
        }
    }
}

extension ResultsListViewController: ResultsListViewModelDelegate {
    func willMakeRequest() {
            spinner.startAnimating()
    }
    
    func didMakeSuccessfullRequest(result: [Result]) {
        items = result
        DispatchQueue.main.async { [weak self] in
            self?.spinner.stopAnimating()
        }
    }
    
    func didFinishRequestWithError(error: Error) {
        defaultAlertInfo(message: "Not Found", closingText: "Close")
    }
    
    private func defaultAlertInfo(title: String? = "", message: String, closingText: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: closingText, style: .cancel, handler: nil))
        return alert
    }
}
