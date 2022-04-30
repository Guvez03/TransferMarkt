//
//  PlayersViewController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 30.03.2022.
//

import Foundation
import UIKit

class ClubsViewController: UIViewController{
    
    @IBOutlet weak var clubsView: ClubsView!
    @IBOutlet weak var filterView: FilterView!
    var presenter: ClubsPresenterProtocol?
    var clubs: Clubs?
    
    override func viewDidLoad() {
        filterView.delegate = self
        presenter?.load(selectedLig: LigName.TR1.rawValue)
    }
}

extension ClubsViewController: ClubsViewProtocol {
    
    func handleOutput(_ handleOutput: ClubsPresenterOutput) {
        switch handleOutput {
        case .loadTitle(let string):
            self.title = string
        case .showClubs(let clubs):
            self.clubs = clubs
            self.clubsView.clubs = clubs
        }
    }
}

extension ClubsViewController: FilterViewDelegate {
    func filterBtnTapped(selectedLig: String) {
        presenter?.load(selectedLig: selectedLig)
    }
}

