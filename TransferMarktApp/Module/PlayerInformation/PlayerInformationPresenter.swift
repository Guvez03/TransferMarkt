//
//  PlayerInformationPresenter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation
import Charts

final class PlayerInformationPresenter: PlayerInformationPresenterProtocol{
    
    private var interactor: PlayerInformationInteractorProtocol
    private var router: PlayerInformationRouterProtocol
    private var view: PlayerInformationViewProtocol
    private var player: Bank?
    
    init(view: PlayerInformationViewProtocol, interactor: PlayerInformationInteractorProtocol, router : PlayerInformationRouterProtocol, player: Bank?){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.player = player
    }
    
    func load() {
        view.handleOutput(.loading(true))
        interactor.delegate = self
        interactor.load(playerId: player?.id ?? "")
    }
    
}

extension PlayerInformationPresenter: PlayerInformationInteractorDelegate {
    func handleOutput(_ output: PlayerInformationInreactorOutput) {
        
        switch output {
        case .loadCharts(let playerMarketValue):
            loadCharts(playerMarketValue: playerMarketValue)
            view.handleOutput(.loading(false))
        case .loadProfile(let profile):
            view.handleOutput(.loadProfile(profile: profile))
            view.handleOutput(.loading(false))
        case .loadTitle(let playerName):
            view.handleOutput(.loadTitle(playerName: playerName))

        }
    }    
}

extension PlayerInformationPresenter {
    
    private func loadCharts(playerMarketValue: PlayerInformation?){

        var arr: [Double] = []
        guard let playerMarketValue = playerMarketValue?.marketValueDevelopment?.reduce([],{ [$1] + $0 }) else {return}

        for item in playerMarketValue {
            arr.append(Double(item.marketValueUnformatted?.formatPoints() ?? 0) )
        }
        
        self.setDataCount(arr.count,values:arr)
        
    }
    
    private func setDataCount(_ count: Int, values:[Double]) {

        let yVals = (0..<count).map { (i) -> ChartDataEntry in

            let val = values[i]

            return ChartDataEntry(x: Double(i), y: val)
        }

        let set1 = LineChartDataSet(entries: yVals, label: "million (€)")
        set1.drawValuesEnabled = false
        set1.drawCirclesEnabled = true
        set1.circleRadius = 2
        set1.setCircleColor(.white)
        set1.setColor(UIColor.appColor(.selectedOrange) ?? .orange)
        set1.highlightLineDashLengths = [8.0, 4.0]
        set1.highlightColor = UIColor.appColor(.selectedOrange) ?? .orange
        set1.highlightLineWidth = 2.0
        
        let data = LineChartData(dataSet: set1)

        data.setValueFont(UIFont(name:"HelveticaNeue-Light", size:10)!)
        
        view.handleOutput(.loadCharts(data: data))
    }
    
}
