//
//  MatchDetailCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell, Reuseable {
    @IBOutlet weak var imgPlayer: UIImageView!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblplayerNumber: UILabel!
    @IBOutlet weak var frontView: UIView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        frontView.layer.cornerRadius = 10
        frontView.layer.masksToBounds = true
    }

    func configure(lineUps: Bank?){
        guard let lineUps = lineUps else {
            return
        }
        imgPlayer.kf.setImage(with: URL(string: lineUps.playerImage ?? ""))
        lblPlayerName.text = "\(lineUps.firstName ?? "") \(lineUps.lastName ?? "")"
        lblplayerNumber.text = lineUps.number
    }
    
}
