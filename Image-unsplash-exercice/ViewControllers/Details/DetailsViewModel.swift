//
//  DetailsViewModel.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import Foundation

class DetailsViewModel: ViewModel {
    
    var result: Result

    init(result: Result? = nil) {
        self.result = result!
    }
}
