//
//  ComapnyScreenAssembly.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 09.06.2021.
//

import UIKit

final class CompanyScreenAssembly
{
    func build() -> UIViewController {
        let storage = CoreDataStorage()
        let router = CompanyScreenRouter()
        let presenter = CompanyScreenPresenter(companyStorage: storage, router: router)
        let controller = CompanyScreenViewController(presenter: presenter)
        router.controller = controller
        return controller
    }
}
