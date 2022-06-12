//
//  HomeViewController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 13.03.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet private weak var bannerView: BannerView!
    @IBOutlet private weak var resultView: ResultView!
    @IBOutlet private weak var newsHeaderView: HeaderView!
    @IBOutlet private weak var resultHeaderView: HeaderView!
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter?.load()
    }
    
    private func setUp(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        resultView.delegate = self
    }
}

extension HomeViewController: HomeViewProtocol {
    func handleOutput(_ output: HomePresenterOutput) {
        switch output {
        case.loadTitle(let title):
            self.title = title
        case .showMatches(let matchesPresentation):
            self.resultView.matches = matchesPresentation
        case .showNews(let newsPresentation):
            self.bannerView.news = newsPresentation.news
        case .loadViewTitle(let newsTitle, let matchesTitle):
            newsHeaderView.title = newsTitle
            resultHeaderView.title = matchesTitle
        }
    }
}

extension HomeViewController : ResultViewDelegate {
    func resultDidSelect(index: Int) {
        presenter?.selectResult(index: index)
    }
}
