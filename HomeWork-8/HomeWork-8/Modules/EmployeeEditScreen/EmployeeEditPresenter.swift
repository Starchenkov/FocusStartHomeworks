//
//  EmployeeEditPresenter.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import Foundation

protocol IEmployeeEditPresenter: AnyObject
{
    func viewDidLoad(viewController: IEmployeeEditScreenController)
    func saveEmployee(name: String, age: String, position: String, education: String, experience: String)
    func close()
}

final class EmployeeEditPresenter
{
    private weak var viewController: IEmployeeEditScreenController?
    private let router: IEmployeeEditScreenRouter
    private let employeeStorage: IEmployeeStorage
    private let selecteedCompany: CompanyModel?
    private var selecteedEmployee: EmployeeModel?
    
    init(employeeStorage: IEmployeeStorage, router: IEmployeeEditScreenRouter, selecteedCompany: CompanyModel?, selecteedEmployee: EmployeeModel?) {
        self.router = router
        self.employeeStorage = employeeStorage
        self.selecteedCompany = selecteedCompany
        self.selecteedEmployee = selecteedEmployee
    }
}

extension EmployeeEditPresenter: IEmployeeEditPresenter {
    func saveEmployee(name: String, age: String, position: String, education: String, experience: String) {
        if name.isEmpty || age.isEmpty || position.isEmpty {
            self.viewController?.showAlert(message: Constants.validationMessageText)
            return
        }
        if let selecteedCompany = selecteedCompany {
            let newEmployee = EmployeeModel(companyUid: selecteedCompany.uid,
                                            name: name, age: age, position: position, experience: experience, education: education)
            employeeStorage.createEmployee(employee: newEmployee) {
                NotificationCenter.default.post(name: Notification.Name("updateNotification"), object: nil)
                self.router.close()
            }
            
        } else {
            if let selecteedEmployee = selecteedEmployee {
                let newEmployee = EmployeeModel(companyUid: selecteedEmployee.companyUid, uid: selecteedEmployee.uid, name: name, age: age, position: position, experience: experience, education: education)
                employeeStorage.updateEmployee(employee: newEmployee) {
                    NotificationCenter.default.post(name: Notification.Name("updateNotification"), object: nil)
                    self.router.close()
                }
            }
        }
    }
    
    func viewDidLoad(viewController: IEmployeeEditScreenController) {
        self.viewController = viewController
    }
    
    func close() {
        router.close()
    }
}
