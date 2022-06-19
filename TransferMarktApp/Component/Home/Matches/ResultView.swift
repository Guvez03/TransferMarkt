//
//  ResultView.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 25.03.2022.
//

import UIKit

protocol ResultViewDelegate {
    func resultDidSelect(index: Int)
}

 final class ResultView: UIView, CustomViewProtocol {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet private weak var tableView: UITableView!
     var delegate: ResultViewDelegate?
     var matches: MatchesPresentation? {
         didSet{
             DispatchQueue.main.async {
                 self.tableView.reloadData()
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
         tableView.delegate = self
         tableView.dataSource = self
         tableView.registerCell(type: ResultCell.self)
     }
    
}

extension ResultView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches?.playClubMatches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.backgroundColor = .clear
        cell.configure(match: matches?.playClubMatches?[indexPath.row])
        cell.layoutIfNeeded()
        cell.setNeedsLayout()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.resultDidSelect(index: indexPath.row)
    }
}
