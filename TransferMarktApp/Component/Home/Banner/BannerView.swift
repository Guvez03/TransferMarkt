//
//  BannerView.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 23.03.2022.
//

import Foundation
import UIKit

class BannerView: UIView,CustomViewProtocol {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var news: [NewsElement] = [] {
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

    private func initialize(){
        commonInit(for: nibName())
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.registerCell(type: BannerCell.self)
        //collectionView?.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: "BannerCell")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.itemSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
    }
}

extension BannerView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(new: news[indexPath.row])
        return cell
    }

}


extension BannerView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10,left: 10, bottom: 10 ,right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = Int((collectionView.bounds.width))
        return CGSize(width: (size / 2) + 30, height: Int(collectionView.bounds.height))
    }
    
}
