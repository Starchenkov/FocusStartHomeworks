//
//  Router.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//

import UIKit

internal final class MainRouter
{
    private let tabbar: UITabBarController
    
    private let firstNavController: UINavigationController
    private let firstViewController: UIViewController
    
    private let secondNavController: UINavigationController
    private let secondScreenViewController: SecondScreenViewController
    
    private let thirdScreenPresentor: ThirdScreenPresenterProtocol
    private let thirdNavController: UINavigationController
    private let thirdViewController: ThirdScreenViewController

    internal init() {
        self.tabbar = UITabBarController()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.firstViewController = storyBoard.instantiateViewController(withIdentifier: "FirstViewController")
        self.firstNavController = UINavigationController(rootViewController: self.firstViewController)
        
        self.secondScreenViewController = SecondScreenViewController()
        self.secondNavController = UINavigationController(rootViewController: self.secondScreenViewController)
        
        self.thirdScreenPresentor = ThirdScreenPresenter()
        self.thirdViewController = ThirdScreenViewController(with: thirdScreenPresentor)
        self.thirdNavController = UINavigationController(rootViewController: self.thirdViewController)
        
        self.configFirstViewController()
        self.configSecondViewController()
        self.configThirdViewController()
        
        self.tabbar.setViewControllers([self.firstNavController,
                                        self.secondNavController,
                                        self.thirdNavController],
                                       animated: true)
    }
    
    internal func returnController() -> UITabBarController {
        return self.tabbar
    }
    
    private func configFirstViewController() {
        self.firstViewController.view.backgroundColor = .white
        let label = UILabel()
        label.text = "MySelf"
        self.firstNavController.navigationBar.topItem?.titleView = label
        self.firstNavController.tabBarItem.title = "MySelf"
        self.firstNavController.tabBarItem.image = UIImage(systemName: "person")
    }
    
    private func configSecondViewController() {
        let label = UILabel()
        label.text = "iOS"
        self.secondNavController.navigationBar.topItem?.titleView = label
        self.secondNavController.tabBarItem.title = "iOS"
        self.secondNavController.tabBarItem.image = UIImage(systemName: "keyboard")
        self.secondScreenViewController.navigationCollectionButtonHandler = {
            let model = DataModel()
            let quoteViewModel = QuoteViewModel(model: model)
            let collectionViewController = CollectionViewController(viewModel: quoteViewModel)
            self.secondNavController.present(collectionViewController, animated: true)
        }
    }

    private func configThirdViewController() {
        let label = UILabel()
        label.text = "Hobby"
        self.thirdNavController.navigationBar.topItem?.titleView = label
        self.thirdNavController.tabBarItem.title = "Hobby"
        self.thirdNavController.tabBarItem.image = UIImage(systemName: "sportscourt")
        self.thirdScreenPresentor.navTableHandler = {
            let model = DataModel()
            let presenter = QuotePresenter(model: model)
            let quoteViewController = QuoteViewController(presenter: presenter)
            self.thirdNavController.pushViewController(quoteViewController, animated: true)
        }
    }
}
