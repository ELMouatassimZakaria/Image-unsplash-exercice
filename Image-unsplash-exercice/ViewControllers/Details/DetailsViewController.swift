//
//  DetailsViewController.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var photosFull: UIImageView!
    @IBOutlet weak var descriptionPhotos: UILabel!
    
    //MARK: - Properties
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        
        UIView.transition(with: photosFull,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
            let url = URL(string: self?.viewModel.result.urls.full ?? "")
            self?.photosFull.kf.setImage(with: url)
        }, completion: nil)
        }
    
    private func setupView() {
        photosFull.image = UIImage(named: "image-gallery")
        descriptionPhotos.text = viewModel.result.description ?? ""
    }
}
