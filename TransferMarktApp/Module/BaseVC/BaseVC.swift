//
//  BaseVC.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 19.06.2022.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
   private var activityIndicatorView: ActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpActivityIndicator()
    }
    
    private func setUpActivityIndicator(){
        activityIndicatorView = ActivityIndicatorView(frame: .zero)
        activityIndicatorView!.center = self.view.center
        self.view.addSubview(activityIndicatorView!)
    }
    
    func updateActivityIndicator(isLoad: Bool){
        guard let activityIndicatorView = activityIndicatorView else {
            setUpActivityIndicator()
            activityIndicatorView?.isLoading = isLoad
            return
        }
        activityIndicatorView.isLoading = isLoad
    }
}
