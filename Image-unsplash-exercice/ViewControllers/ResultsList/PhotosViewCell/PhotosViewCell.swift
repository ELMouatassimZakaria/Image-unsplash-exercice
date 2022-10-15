//
//  PhotosViewCell.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import UIKit
import Kingfisher


class PhotosViewCell: UITableViewCell {
    
    @IBOutlet weak var photos: UIImageView!
    @IBOutlet weak var descroptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(model: Result) {
        descroptionLabel.text = model.description ?? ""
        
        let url = URL(string: model.urls.raw)
        photos.kf.setImage(with: url, placeholder: UIImage(named: "image-gallery"))
        //photos.imageFromServerURL(urlString: model.urls.raw, PlaceHolderImage: UIImage(named: "image-gallery") ?? UIImage())
    }
}
