//
//  IEmployeeStorage.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//
protocol IEmployeeStorage
{
    func getEmployees(for company: CompanyModel) -> [EmployeeModel]
    func createEmployee(employee: EmployeeModel, completion: @escaping () -> Void)
    func updateEmployee(employee: EmployeeModel, completion: @escaping () -> Void)
    func removeEmployee(employee: EmployeeModel)
}
