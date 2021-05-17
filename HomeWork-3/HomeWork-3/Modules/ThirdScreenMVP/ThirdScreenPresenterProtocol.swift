//
//  ThirdViewPresenterProtocol.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 17.05.2021.
//

protocol ThirdScreenPresenterProtocol: AnyObject {
    var navTableHandler: (() -> (Void))? { get set }
    func convertDataModel(model: DataModel) -> HobbyInfo
    func didLoad(view: ThirdScreenViewProtocol)
    func showView()
    func tapShowTableButton()
    func tapChangeModelButton()
}
