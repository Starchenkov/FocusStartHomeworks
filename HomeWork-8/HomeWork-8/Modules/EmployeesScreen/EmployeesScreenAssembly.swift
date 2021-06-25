//
//  EmployeesScreenAssembly.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import UIKit

final class EmployeesScreenAssembly
{
    func build(selecteedCompany: CompanyModel) -> UIViewController {
        let storage = CoreDataStorage()
        let router = EmployeeScreenRouter()
        let presenter = EmployeeScreenPresenter(employeeStorage: storage, router: router, company: selecteedCompany)
        let controller = EmployeeScreenViewController(presenter: presenter)
        router.controller = controller
        return controller
    }
}
