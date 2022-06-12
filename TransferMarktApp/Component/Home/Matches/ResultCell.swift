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
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    // neişe yarıyor
    override func layoutSubviews() {
        super.layoutSubviews()

        viewContent.layer.cornerRadius = 10
        viewContent.layer.masksToBounds = true
    }
    
    func initialize(){

    }
    
    func configure(match: PlayClubMatch?){
        guard let match = match else { return }
        let goalsAwayScore = Int(match.resultObject?.goalsAway ?? "0") ?? 0
        let goalsHomeScore = Int(match.resultObject?.goalsHome ?? "0") ?? 0
        lblGoalsAway.textColor = UIColor.white
        lblGoalsHome.textColor = UIColor.white
        
        if (goalsAwayScore != goalsHomeScore) {
            if (goalsAwayScore > goalsHomeScore){
                lblGoalsAway.textColor = UIColor.appColor(.selectedOrange)
            }
            else if (goalsAwayScore < goalsHomeScore){
                lblGoalsHome.textColor = UIColor.appColor(.selectedOrange)
            }
        }
        
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
