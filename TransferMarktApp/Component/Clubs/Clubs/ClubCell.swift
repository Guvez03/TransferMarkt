//
//  ClubCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation
import UIKit

final class ClubCell: UICollectionViewCell, Reuseable {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var clubImage: UIImageView!
    @IBOutlet private weak var lblClubName: UILabel!
    @IBOutlet private weak var lblView: UIView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.masksToBounds = true
        self.containerView.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configure(club: Club?){
        clubImage.kf.setImage(with: URL(string: club?.image ?? ""))
        lblClubName.text = club?.name
        
    }
}

