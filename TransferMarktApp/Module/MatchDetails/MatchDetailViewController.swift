//
//  MatchDetailsController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation
import UIKit

class MatchDetailViewController: UIViewController{

    var presenter: MatchDetailPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    private var clubMatch: PlayClubMatch?
    private var lineUps: LineUPSResponse?
    private var clubsSelected: ClubSelected?

    override func viewDidLoad() {
     super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(type: ResultCell.self)
        tableView.registerCell(type: HomeAwaySegmentCell.self)
        tableView.registerCell(type: PlayerCell.self)

        presenter?.load()
        presenter?.loadLineUps()

    }
}

extension MatchDetailViewController: MatchDetailViewProtocol {
    func handleOutput(_ output: MatchDetailPresenterOutput) {
        switch output {
        case .loadTitle:
            break
        case .loadResults(let clubMatch):
            self.clubMatch = clubMatch
        case .loadLineUps(let lineUps):
            self.lineUps = lineUps
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MatchDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return lineUps?.formations?.home?.start?.keys.count ?? 0
        default:
            return 0
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell: ResultCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configure(match: clubMatch)
            return cell
        case 1:
            let cell: HomeAwaySegmentCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.backgroundColor = UIColor.appColor(.lightGray)
            cell.delegate = self
            return cell
        case 2:
            var lineUpsValues: Dictionary<String, Bank>.Values?
            switch clubsSelected {
            case .away:
                lineUpsValues = Array(arrayLiteral: lineUps?.formations?.away?.start)[0]?.values
            case .home:
                lineUpsValues = Array(arrayLiteral: lineUps?.formations?.home?.start)[0]?.values
            case .none:
                lineUpsValues = Array(arrayLiteral: lineUps?.formations?.home?.start)[0]?.values
            }
            
            let cell: PlayerCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.backgroundColor = UIColor.appColor(.lightGray)
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            
            if let lineUpsValue = lineUpsValues {
                for (index, item) in lineUpsValue.enumerated() {
                    if indexPath.row == index {
                        cell.configure(lineUps: item)
                    }
                }
            }
            lineUpsValues = nil
            return cell

        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 100
        case 2:
            return 100
        default:
            return tableView.estimatedRowHeight
        }
    }
}

extension MatchDetailViewController: HomeAwaySegmentCellDelegate {
    func segmentedDidselect(selected: ClubSelected) {
            self.clubsSelected = selected
            self.tableView.reloadData()
    }
}
 
