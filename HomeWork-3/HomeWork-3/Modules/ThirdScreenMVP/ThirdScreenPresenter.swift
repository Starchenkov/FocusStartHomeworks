//
//  ThirdViewPresenter.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 17.05.2021.
//

import Foundation

class ThirdScreenPresenter: ThirdScreenPresenterProtocol {

    internal var navTableHandler: (() -> (Void))? = nil
    
    private let model = DataModel()
    private weak var thirdScreenView: ThirdScreenViewProtocol?
    
    func didLoad(view: ThirdScreenViewProtocol) {
        self.thirdScreenView = view
        showView()
    }
    
    func showView() {
        let hobbyInfo = self.convertDataModel(model: model)
        thirdScreenView?.setInfo(hobbyInfo: hobbyInfo)
    }
    
    internal func convertDataModel(model: DataModel) -> HobbyInfo {
        return model.hobbyInfo
    }
    
    private func changeDataModel() {
        self.model.hobbyInfo.hobbyName = "\(Date())"
        self.showView()
    }
    
    func tapShowTableButton() {
        self.navTableHandler?()
    }
    
    func tapChangeModelButton() {
        changeDataModel()
    }
}
