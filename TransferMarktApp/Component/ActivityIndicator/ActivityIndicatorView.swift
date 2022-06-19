//
//  ActivityIndicator.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 19.06.2022.
//

import Foundation
import UIKit

final class ActivityIndicatorView: UIView,CustomViewProtocol{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    var isLoading: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.isLoading ? self.activityIndicatorView.startAnimating() : self.activityIndicatorView.stopAnimating()
                self.activityIndicatorView.isHidden = !self.isLoading
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        commonInit(for: nibName())
    }
}
