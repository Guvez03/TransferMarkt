//
//  PlayersViewController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 30.03.2022.
//

import Foundation
import UIKit

class ClubsViewController: BaseVC{
    
    @IBOutlet private weak var clubsView: ClubsView!
    @IBOutlet private weak var filterView: FilterView!
    var presenter: ClubsPresenterProtocol?
    private var clubs: Clubs?
    
    override func viewDidLoad() {
        setUp()
        presenter?.load(selectedLig: LigName.TR1.rawValue)
    }
    
    private func setUp(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        filterView.delegate = self
    }
}

extension ClubsViewController: ClubsViewProtocol {
    
    func handleOutput(_ handleOutput: ClubsPresenterOutput) {
        switch handleOutput {
        case .laoding(let isLoad):
            updateActivityIndicator(isLoad: isLoad)
        case .loadTitle(let title):
            self.title = title
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

