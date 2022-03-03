//
//  AppCoordinator.swift
//  WeatherRx
//
//  Created by MacOS on 3.03.2022.
//


import Foundation
import UIKit
import RxSwift
import XCoordinator

enum AppRoute: Route {
    case cityList
    case splash
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .splash)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
            
        case . splash :
            let viewController = SplashViewController()
            let viewModel = SplashViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
            return .push(viewController, animation: .default)
            

        case .cityList:
            let coordinator = CityListCoordinator()
            return .presentFullScreen(coordinator, animation: .default)
            
        }
    }
}
