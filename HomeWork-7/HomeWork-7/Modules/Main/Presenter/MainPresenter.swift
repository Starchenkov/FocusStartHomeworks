//
//  MainPresenter.swift
//  HomeWork-7
//
//  Created by Sergey Starchenkov on 28.05.2021.
//

import Foundation
import UIKit.UIImage

protocol MainPresenterProtocol
{
    func viewDidLoad(view: MainViewProtocol)
    func numberOfRowTable() -> Int
    func configCell(cell: ImageTableViewCell, indexPath: IndexPath)
    func downloadButtonTap(text: String)
}

class MainPresenter: MainPresenterProtocol
{
    private var networkManager: NetworkManagerProtocol
    private weak var mainView: MainViewProtocol?
    private var arrayImageData = [UIImage]()
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    public func viewDidLoad(view: MainViewProtocol) {
        self.mainView = view
    }
    
    public func numberOfRowTable() -> Int {
        return arrayImageData.count
    }
    
    public func configCell(cell: ImageTableViewCell, indexPath: IndexPath) {
        let image = arrayImageData[indexPath.row]
        cell.set(with: image)
    }
    
    public func downloadButtonTap(text: String) {
        networkManager.loadImage(url: text) { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch error {
                case .wrongURL:
                    self.mainView?.showAlert(title: Constants.titleAlertError, message: Constants.messageWrongURL)
                case .notData:
                    self.mainView?.showAlert(title: Constants.titleAlertError, message: Constants.messageNotData)
                }
            }
        }
        
        networkManager.onProgress = { progress in
            DispatchQueue.main.async {
                self.mainView?.updateDownloadProgress(progress: progress)
            }
        }
        
        networkManager.fileLocationUrl = { [weak self] location in
            guard let self = self else { return }
            if let imageData = try? Data(contentsOf: location), let image = UIImage(data: imageData) {
                print("преобразовали данные в картинку")
                self.arrayImageData.append(image)
                DispatchQueue.main.async {
                    self.mainView?.reloadData()
                    print("картинку добавили в таблицу, интерфейс обновлен")
                }
            } else {
                DispatchQueue.main.async {
                    self.mainView?.reloadData()
                    self.mainView?.showAlert(title: Constants.titleAlertError, message: Constants.messageDataIsNotImage)
                }
            }
        }
    }
}
