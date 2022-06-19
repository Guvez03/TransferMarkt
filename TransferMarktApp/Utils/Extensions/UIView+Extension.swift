//
//  UIView+Extension.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 24.03.2022.
//

import UIKit


protocol CustomViewProtocol {
    var contentView: UIView! {get}
    func commonInit(for customViewName: String)
}
extension CustomViewProtocol where Self: UIView {
    func commonInit(for customViewName: String) {
        Bundle.main.loadNibNamed(customViewName, owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

// MARK: - Nip name
extension UIView {
     func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}

extension UIView {
    func setUpActivityIndicatorView(){
        var activityIndicatorView: ActivityIndicatorView!
        activityIndicatorView = ActivityIndicatorView(frame: .zero)
        activityIndicatorView.center = self.center
        self.addSubview(activityIndicatorView)
    }
}

    


