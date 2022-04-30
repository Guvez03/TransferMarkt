//
//  AppContainer.swift
//  MovieBox
//
//  Created by Ahmet Güvez on 5.03.2022.
//

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer{
    let router = AppRouter()
    let service = MovieBoxAPI()
}
