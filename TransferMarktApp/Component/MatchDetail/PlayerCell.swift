//
//  MatchDetailCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell, Reuseable {
    @IBOutlet private weak var imgPlayer: UIImageView!
    @IBOutlet private weak var lblPlayerName: UILabel!
    @IBOutlet private weak var lblplayerNumber: UILabel!
    @IBOutlet private weak var frontView: UIView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frontView.layer.cornerRadius = 10
        frontView.layer.masksToBounds = true
    }

    func configure(player: Bank?){
        guard let player = player else { return }
        imgPlayer.kf.setImage(with: URL(string: player.playerImage ?? ""))
        lblPlayerName.text = "\(player.firstName ?? "") \(player.lastName ?? "")"
        lblplayerNumber.text = player.number
    }
    
}
