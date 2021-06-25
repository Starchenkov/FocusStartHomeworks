//
//  EmployeeScreenRouter.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//
import UIKit

protocol IEmployeeScreenRouter: AnyObject
{
    func editEmployee(employee: EmployeeModel)
    func createEmployee(selecteedCompany: CompanyModel)
}

final class EmployeeScreenRouter: IEmployeeScreenRouter
{
    weak var controller: UIViewController?
    
    func editEmployee(employee: EmployeeModel) {
        let controller = EmployeeEditScreenAssembly().buildEdit(selecteedEmployee: employee)
        let navigationController = UINavigationController(rootViewController: controller)
        self.controller?.navigationController?.present(navigationController, animated: true)
    }
    
    func createEmployee(selecteedCompany: CompanyModel) {
        let controller = EmployeeEditScreenAssembly().buildNew(selecteedCompany: selecteedCompany)
        let navigationController = UINavigationController(rootViewController: controller)
        self.controller?.navigationController?.present(navigationController, animated: true)
    }
}
