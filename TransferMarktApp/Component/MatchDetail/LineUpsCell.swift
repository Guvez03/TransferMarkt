//
//  HomeAwaySegmentCell.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation
import UIKit

enum ClubSelected {
    case home
    case away
}

protocol LineUpsCellDelegate {
    func segmentedDidselect(selected: ClubSelected)
}

class LineUpsCell: UITableViewCell,Reuseable{
    
    @IBOutlet private weak var segmented: UISegmentedControl!
    var delegate: LineUpsCellDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func didChangeStatement(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            delegate?.segmentedDidselect(selected: .home)
        case 1:
            delegate?.segmentedDidselect(selected: .away)
        default:
            break
        }
    }
    
}


