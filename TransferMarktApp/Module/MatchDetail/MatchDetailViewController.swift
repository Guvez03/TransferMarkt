//
//  MatchDetailsController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation
import UIKit

class MatchDetailViewController: BaseVC{
    
    var presenter: MatchDetailPresenterProtocol?
    @IBOutlet private weak var tableView: UITableView!
    private var clubMatch: PlayClubMatch?
    private var lineUps: LineUPSResponse?
    private var clubsSelected: ClubSelected?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter?.loadResult()
        presenter?.loadLineUps()
    }
    
    private func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(type: ResultCell.self)
        tableView.registerCell(type: LineUpsCell.self)
        tableView.registerCell(type: PlayerCell.self)
        tableView.separatorInset = .zero
    }
}

extension MatchDetailViewController: MatchDetailViewProtocol {
    func handleOutput(_ output: MatchDetailPresenterOutput) {
        switch output {
        case .loading(let isLoad):
            updateActivityIndicator(isLoad: isLoad)
        case .loadTitle:
            break
        case .loadResult(let clubMatch):
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
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell: LineUpsCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.backgroundColor = UIColor.appColor(.blue)
            cell.delegate = self
            return cell
        case 2:
            let cell: PlayerCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.backgroundColor = UIColor.appColor(.blue)
            let player = Utils.parseDictionary(clubsSelected: clubsSelected, lineUps: lineUps, indexPath: indexPath)
            cell.configure(player: player)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 100
        case 2:
            return 100
        default:
            return tableView.estimatedRowHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let player = Utils.parseDictionary(clubsSelected: clubsSelected, lineUps: lineUps, indexPath: indexPath)
            presenter?.playerDetail(player: player)
        }
    }
}

extension MatchDetailViewController: LineUpsCellDelegate {
    func segmentedDidselect(selected: ClubSelected) {
        self.clubsSelected = selected
        self.tableView.reloadData()
    }
}

