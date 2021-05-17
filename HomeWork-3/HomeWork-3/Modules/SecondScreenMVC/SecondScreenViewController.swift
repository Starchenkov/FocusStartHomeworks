//
//  SecondViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 02.05.2021.
//
import UIKit

class SecondScreenViewController: UIViewController
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

// MARK: LoggerVC
extension SecondScreenViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LoggerVC.viewWillAppearPrint(String(describing: type(of: self)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LoggerVC.viewDidAppearPrint(String(describing: type(of: self)))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LoggerVC.viewWillDisappearPrint(String(describing: type(of: self)))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LoggerVC.viewDidDisappear(String(describing: type(of: self)))
    }
}
