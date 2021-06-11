//
//  EmployeeScreenPresenter.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import Foundation

protocol IEmployeeScreenPresenter: AnyObject
{
    func viewDidLoad(viewController: IEmployeeScreenController)
    func getCountEmployees() -> Int
    func configureCell(cell: EmployeeScreenCell, indexPath: IndexPath)
    func createEmployee()
    func editEmploees(forSelected indexPath: IndexPath)
    func removeEmployee(indexPath: IndexPath)
}

final class EmployeeScreenPresenter
{
    private weak var viewController: IEmployeeScreenController?
    private let employeeStorage: IEmployeeStorage
    private let router: IEmployeeScreenRouter
    private var selecteedCompany: CompanyModel
    private var employees: [EmployeeModel]?
    
    init(employeeStorage: IEmployeeStorage, router: IEmployeeScreenRouter, company: CompanyModel) {
        self.employeeStorage = employeeStorage
        self.router = router
        self.selecteedCompany = company
        self.addObserver()
        self.displayEmployees()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.displayEmployees),
                                               name: Notification.Name("updateNotification"),
                                               object: nil)
    }
}

extension EmployeeScreenPresenter: IEmployeeScreenPresenter
{
    func viewDidLoad(viewController: IEmployeeScreenController) {
        self.viewController = viewController
    }
    
    func getCountEmployees() -> Int {
        return self.employees?.count ?? 0
    }
    
    func configureCell(cell: EmployeeScreenCell, indexPath: IndexPath) {
        if let employee = self.employees?[indexPath.row] {
            let viewModel = self.convertViewModel(employee: employee)
            cell.update(vm: viewModel)
        }
    }
    
    func createEmployee() {
        router.createEmployee(selecteedCompany: self.selecteedCompany)
    }
    
    func editEmploees(forSelected indexPath: IndexPath) {
        if let employee = self.employees?[indexPath.row] {
            router.editEmployee(employee: employee)
        }
    }
    
    func removeEmployee(indexPath: IndexPath) {
        guard let removeEmployee = employees?[indexPath.row] else { return }
        employeeStorage.removeEmployee(employee: removeEmployee)
        employees?.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.viewController?.updateUI()
        }
    }
    
    private func convertViewModel(employee: EmployeeModel) -> EmployeeScreenViewModel {
        let viewModel = EmployeeScreenViewModel(nameEmployee: employee.name,
                                                position: employee.position)
        return viewModel
    }
    
    @objc private func displayEmployees() {
        let result = employeeStorage.getEmployees(for: selecteedCompany)
        self.employees = result
        DispatchQueue.main.async {
            self.viewController?.updateUI()
        }
    }
}
