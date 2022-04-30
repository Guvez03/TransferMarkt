//
//  ClubCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation
import UIKit

final class ClubCell: UICollectionViewCell, Reuseable {
    
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var lblClubName: UILabel!
    @IBOutlet weak var lblView: UIView!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.appColor(.pinkColor)?.cgColor
        
        lblView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        lblView.layer.masksToBounds = true
        lblView.layer.cornerRadius = 10
        
    }
}

