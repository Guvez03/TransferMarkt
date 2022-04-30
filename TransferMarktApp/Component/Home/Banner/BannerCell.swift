//
//  BannerCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 23.03.2022.
//

import Foundation
import UIKit
import Kingfisher

class BannerCell: UICollectionViewCell,Reuseable{
        
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var newName: UILabel!
    
    @IBOutlet weak var contView: UIView!
 
    // neişe yarıyor
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // neişe yarıyor
    override func layoutSubviews() {
        super.layoutSubviews()
        contView.layer.cornerRadius = 10
        contView.layer.masksToBounds = true
    }
    
    func configure(new: NewsElement?){
        guard let new = new else {return}
        
        newImage.image = nil
        
        name.text = new.fullNewsDate
        newName.text = new.newsTeaser
        
        if let newsSpotlightFirstImage = new.newsSpotlightFirstImage, !newsSpotlightFirstImage.isEmpty {
            guard let url = URL(string: newsSpotlightFirstImage) else {return}
            newImage.kf.setImage(with: url)
        }else{
            newImage.image = UIImage(named: "mock-image")
        }

        
    }
}


