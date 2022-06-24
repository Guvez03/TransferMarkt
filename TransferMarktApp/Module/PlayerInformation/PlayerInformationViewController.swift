//
//  PlayerInformationViewController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation
import UIKit
import Charts

final class PlayerInformationViewController: BaseVC {
    @IBOutlet private weak var lineChartView: LineChartView!
    var presenter: PlayerInformationPresenterProtocol?
    
    @IBOutlet private weak var lblBirthDate: UILabel!
    @IBOutlet private weak var lblBirthPlace: UILabel!
    @IBOutlet private weak var lblAge: UILabel!
    @IBOutlet private weak var lblLength: UILabel!
    @IBOutlet private weak var lblCountry: UILabel!
    @IBOutlet private weak var lblPositionGroup: UILabel!
    @IBOutlet private weak var lblFoot: UILabel!
    @IBOutlet private weak var lblClub: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpChart()
        presenter?.load()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setUp(){
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
    }
    
    private func setUpChart(){
        lineChartView.backgroundColor = UIColor.appColor(.darkBlue)
        lineChartView.borderColor = .orange
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = true
        lineChartView.leftAxis.axisLineColor = UIColor.appColor(.selectedOrange) ?? .orange
        lineChartView.leftAxis.labelTextColor = UIColor.appColor(.selectedOrange) ?? .orange
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.enabled = false
    }
}

extension PlayerInformationViewController: PlayerInformationViewProtocol {
    func handleOutput(_ output: PlayerInformationPresenterOutput) {
        switch output {
        case .loading(let isLoad):
            updateActivityIndicator(isLoad: isLoad)
        case .loadCharts(let data):
            updateCharts(data: data as? LineChartData)
        case .loadTitle(let playerName):
            self.title = playerName
        case .loadProfile(let profile):
            setProfileData(profile: profile)
        }
    }
}

extension PlayerInformationViewController {
    
    private func updateCharts(data: LineChartData?){
        lineChartView.animate(yAxisDuration: 2.5)
        lineChartView.data = data
        lineChartView.legend.textColor = UIColor.appColor(.selectedOrange) ?? .orange
    }
    
   private func setProfileData(profile: ProfileResponse?){
        guard let profile = profile else {return}

        lblBirthDate.text = profile.playerProfile?.dateOfBirth
        lblBirthPlace.text = profile.playerProfile?.birthplace
        lblAge.text = profile.playerProfile?.age
        lblLength.text = profile.playerProfile?.height
        lblCountry.text = profile.playerProfile?.country
        lblPositionGroup.text = profile.playerProfile?.positionGroup
        lblFoot.text = profile.playerProfile?.foot
        lblClub.text = profile.playerProfile?.club
    }
}

