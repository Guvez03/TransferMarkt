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
        lineChartView.xAxis.labelTextColor = UIColor.appColor(.selectedOrange) ?? .orange
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.xAxis.labelPosition = .bottom
    }
}

extension PlayerInformationViewController: PlayerInformationViewProtocol {
    func handleOutput(_ output: PlayerInformationPresenterOutput) {
        switch output {
        case .loadCharts(let playerMarketValue):
            loadCharts(playerMarketValue: playerMarketValue)
        case .loadTitle(let playerName):
            self.title = playerName
        case .loadProfile(let profile):
            setProfileData(profile: profile)
        }
    }
}

extension PlayerInformationViewController {
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
    
    private func loadCharts(playerMarketValue: PlayerInformation?){
        
        var arr: [Double] = []
        guard let playerMarketValue = playerMarketValue?.marketValueDevelopment?.reduce([],{ [$1] + $0 }) else {return}

        for item in playerMarketValue {
            arr.append(Double(item.marketValueUnformatted?.formatPoints() ?? 0) )
        }
        
        self.setDataCount(arr.count,values:arr)
        lineChartView.animate(yAxisDuration: 2.5)
    }
    
    
    private func setDataCount(_ count: Int, values:[Double]) {

        let yVals = (0..<count).map { (i) -> ChartDataEntry in

            let val = values[i]

            return ChartDataEntry(x: Double(i), y: val)
        }

        let set1 = LineChartDataSet(entries: yVals, label: "million")
        set1.drawIconsEnabled = false
        set1.circleRadius = 1
        set1.setCircleColor(.clear)
        set1.setColor(.orange)
        set1.valueTextColor = UIColor.appColor(.greenColor) ?? .green

        let data = LineChartData(dataSet: set1)

        data.setValueFont(UIFont(name:"HelveticaNeue-Light", size:10)!)
        lineChartView.data = data
        
        let xAxis = lineChartView.xAxis
        xAxis.setLabelCount(yVals.count, force: false)
    }
}

