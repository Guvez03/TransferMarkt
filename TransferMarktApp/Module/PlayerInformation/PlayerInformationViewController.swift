//
//  PlayerInformationViewController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation
import UIKit
import Charts

final class PlayerInformationViewController: UIViewController {
    @IBOutlet weak var lineChartView: LineChartView!
    var presenter: PlayerInformationPresenterProtocol?
    
    @IBOutlet weak var lblBirthDate: UILabel!
    @IBOutlet weak var lblBirthPlace: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblPositionGroup: UILabel!
    @IBOutlet weak var lblFoot: UILabel!
    @IBOutlet weak var lblClub: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineChartView.backgroundColor = .lightGray
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        
        lineChartView.xAxis.labelPosition = .bottom

        presenter?.load()
    }
}

extension PlayerInformationViewController: PlayerInformationViewProtocol {
    func handleOutput(_ output: PlayerInformationPresenterOutput) {
        switch output {
        case .loadCharts(let playerMarketValue):
            loadCharts(playerMarketValue: playerMarketValue)
            break
        case .loadTitle:
            self.title = "CHARTS"
        case .loadProfile(profile: let profile):
            setProfileData(profile: profile)
        }
    }
    
    
    func setProfileData(profile: ProfileResponse?){
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
    
    func loadCharts(playerMarketValue: PlayerInformation?){
        
        var arr: [Double] = []
        guard let playerMarketValue = playerMarketValue?.marketValueDevelopment else {return}

        for item in playerMarketValue {
            arr.append(Double(item.marketValueUnformatted ?? 0) )
        }
        
        self.setDataCount(arr.count,values:arr)
        lineChartView.animate(yAxisDuration: 2.5)
    }
    
    
    func setDataCount(_ count: Int, values:[Double]) {

        let yVals = (0..<count).map { (i) -> ChartDataEntry in

            let val = values[i]

            return ChartDataEntry(x: Double(i), y: val)
        }

        let set1 = LineChartDataSet(entries: yVals, label: "€")
        set1.drawIconsEnabled = false

        let data = LineChartData(dataSet: set1)

        data.setValueFont(UIFont(name:"HelveticaNeue-Light", size:10)!)
        lineChartView.data = data
        
        let xAxis = lineChartView.xAxis
        xAxis.setLabelCount(yVals.count, force: false)
    }
    
}

