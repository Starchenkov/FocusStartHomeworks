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
        let thirdScreenModel = self.convertDataModel(model: model)
        thirdScreenView?.setInfo(with: thirdScreenModel)
    }
    
    private func convertDataModel(model: DataModel) -> ThirdScreenModel {
        let screenModel = ThirdScreenModel(imageName: model.hobbyInfo.hobbyImageName,
                                           titleName: model.hobbyInfo.hobbyName,
                                           description: model.hobbyInfo.hobbyDescription,
                                           plans: model.hobbyInfo.hobbyPlanned)
        return screenModel
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
