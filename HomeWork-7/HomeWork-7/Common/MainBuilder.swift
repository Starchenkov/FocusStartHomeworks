//
//  MainBuilder.swift
//  HomeWork-7
//
//  Created by Sergey Starchenkov on 28.05.2021.
//

import UIKit

class Builder
{
    static func createMainViewController() -> UIViewController {
        let networkManager = NetworkManager()
        let presenter = MainPresenter(networkManager: networkManager)
        let viewController = MainViewController(presenter: presenter)
        return viewController
    }
}
