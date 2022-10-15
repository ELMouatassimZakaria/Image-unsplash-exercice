//
//  ResultsListViewModel.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import UIKit
import Combine

protocol ResultsListViewModelDelegate: AnyObject {
    func willMakeRequest()
    func didMakeSuccessfullRequest(result: [Result])
    func didFinishRequestWithError(error: Error)
}

class ResultsListViewModel: ViewModel {
    
  //MARK: - Protperties
    var delegate: ResultsListViewModelDelegate!
    var results: [Result]!
    
    init(delegate: ResultsListViewModelDelegate? = nil){
        self.delegate = delegate
    }
    
    func fetchResults(query: String) {
        delegate.willMakeRequest()
        guard let url = URL(string: baseUrl + query) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let data = data , let strongSelf = self else { return }
            do {
                let data = try JSONDecoder().decode(Results.self, from: data)
                strongSelf.delegate.didMakeSuccessfullRequest(result: data.results)
            } catch {
                self?.delegate.didFinishRequestWithError(error: error )
            }
        }
        task.resume()
    }
}
