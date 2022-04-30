//
//  HeaderView.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 26.03.2022.
//

import UIKit

final class HeaderView: UIView, CustomViewProtocol {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblHeaderTitle: UILabel!
    @IBOutlet weak var btnHeader: UIButton!
    
    var title: String = "" {
        didSet {
            lblHeaderTitle.text = title
            btnHeader.setTitle("SEE ALL", for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initilaize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initilaize()
    }
    func initilaize() {
        commonInit(for: nibName())
    }

    
}
