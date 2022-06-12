//
//  ClubsView.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 13.04.2022.
//

import Foundation
import UIKit

class ClubsView: UIView, CustomViewProtocol {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    var clubs: Clubs? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
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
    
    
    func initialize(){
        commonInit(for: nibName())
        collectionView.registerCell(type: ClubCell.self)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        collectionView!.collectionViewLayout = layout        
    }
}


extension ClubsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clubs?.clubs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ClubCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let club = clubs?.clubs?[indexPath.row]
        cell.clubImage.kf.setImage(with: URL(string: club?.image ?? ""))
        cell.lblClubName.text = club?.name
        return cell
    }
}
extension ClubsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10,left: 20, bottom: 10 ,right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = Int((collectionView.bounds.width))
        return CGSize(width: (size / 2) - 30, height: (size / 4) + 30)
    }
}
