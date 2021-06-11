//
//  EmployeeEditScreenAssembly.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import UIKit

final class EmployeeEditScreenAssembly
{
    func buildNew(selecteedCompany: CompanyModel) -> UIViewController {
        let storage = CoreDataStorage()
        let router = EmployeeEditScreenRouter()
        let presenter = EmployeeEditPresenter(employeeStorage: storage, router: router, selecteedCompany: selecteedCompany, selecteedEmployee: nil)
        let controller = EmployeeEditViewController(presenter: presenter)
        router.controller = controller
        return controller
    }
    
    func buildEdit(selecteedEmployee: EmployeeModel) -> UIViewController {
        let storage = CoreDataStorage()
        let router = EmployeeEditScreenRouter()
        let presenter = EmployeeEditPresenter(employeeStorage: storage, router: router, selecteedCompany: nil, selecteedEmployee: selecteedEmployee)
        let controller = EmployeeEditViewController(presenter: presenter)
        controller.employee = selecteedEmployee
        router.controller = controller
        return controller
    }
}
