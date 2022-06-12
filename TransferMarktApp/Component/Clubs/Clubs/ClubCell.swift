//
//  ClubCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation
import UIKit

final class ClubCell: UICollectionViewCell, Reuseable {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var lblClubName: UILabel!
    @IBOutlet weak var lblView: UIView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.masksToBounds = true
        self.containerView.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

