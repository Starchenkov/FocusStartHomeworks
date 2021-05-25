//
//  SecondViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 02.05.2021.
//
import UIKit

class SecondScreenViewController: LoggerViewController
{
    internal var navigationCollectionButtonHandler: (() -> (Void))?
    
    private var screenView: SecondScreenView?
    private let model = DataModel()
    
    override func loadView() {
        screenView = SecondScreenView()
        self.view = screenView
        self.screenView?.tapCollectionButtonHandler = navigationCollectionButtonHandler
        self.screenView?.tapChangeDataButtonHandler = { [weak self] in
            self?.changeDataModel()
        }
        self.setInfo()
    }
    
    private func setInfo() {
        let iosInfo = self.model.iosInfo
        screenView?.setInfo(with: iosInfo)
    }
    
    private func changeDataModel() {
        self.model.iosInfo.iOSDescriptions = "\(Date())"
        self.setInfo()
    }
}
