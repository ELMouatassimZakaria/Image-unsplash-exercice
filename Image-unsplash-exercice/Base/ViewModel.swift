//
//  ViewModel.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import Foundation
import UIKit

public class ViewModel {
    let baseUrl = "https://api.unsplash.com/search/photos?query="
    let token = "kiUtJDTFi2D7J-o7jR0xM5NiAXekYsQ1Ndqt_zcQbSM"
    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate

    init() {}
}
