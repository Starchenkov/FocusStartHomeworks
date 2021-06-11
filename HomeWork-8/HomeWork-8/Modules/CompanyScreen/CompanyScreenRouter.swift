//
//  CompanyScreenRouter.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//
import UIKit

protocol ICompanyScreenRouter: AnyObject
{
    func openEmployees(selectedCompany: CompanyModel)
}

final class CompanyScreenRouter: ICompanyScreenRouter
{
    weak var controller: UIViewController?
    
    func openEmployees(selectedCompany: CompanyModel) {
        let controller = EmployeesScreenAssembly().build(selecteedCompany: selectedCompany)
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
