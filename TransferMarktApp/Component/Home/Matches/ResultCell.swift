//
//  ResultCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 25.03.2022.
//

import UIKit
import Kingfisher

final class ResultCell: UITableViewCell, Reuseable {
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblGoalsHome: UILabel!
    @IBOutlet weak var lblGoalsAway: UILabel!
    @IBOutlet weak var imgHomeClub: UIImageView!
    @IBOutlet weak var imgAwayClub: UIImageView!
    @IBOutlet weak var lblHomeClubName: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblAwayClubName: UILabel!
    @IBOutlet weak var lblAway: UILabel!
    // neişe yarıyor
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // neişe yarıyor
    override func layoutSubviews() {
        super.layoutSubviews()
        viewContent.layer.cornerRadius = 10
        viewContent.layer.masksToBounds = true
    }
    
    func configure(match: PlayClubMatch?){
        guard let match = match else { return }
        lblGoalsAway.text = match.resultObject?.goalsAway
        lblGoalsHome.text = match.resultObject?.goalsHome
        let imgHomeClubUrl = URL(string: match.homeClubImage ?? "")
        imgHomeClub.kf.setImage(with: imgHomeClubUrl)
        let imgAwayClubUrl = URL(string: match.awayClubImage ?? "")
        imgAwayClub.kf.setImage(with: imgAwayClubUrl)
        lblHomeClubName.text = match.homeClubName
        lblAwayClubName.text = match.awayClubName
    }
    
}
