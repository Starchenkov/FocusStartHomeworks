//
//  CoreDataStorage.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 08.06.2021.
//

import Foundation
import CoreData

final class CoreDataStorage
{
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

extension CoreDataStorage: ICompanyStorage
{
    func getCompanies() -> [CompanyModel] {
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        do {
            let result = try self.container.viewContext.fetch(fetchRequest).compactMap{CompanyModel(company: $0)}
            return result
        } catch {
            print(error.localizedDescription)
            return [CompanyModel]()
        }
    }
    
    func createCompany(company: CompanyModel) {
        self.container.performBackgroundTask { context in
            do {
                let object = Company(context: context)
                object.uid = company.uid
                object.name = company.name
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func removeCompany(company: CompanyModel) {
        self.container.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "\(#keyPath(Company.uid)) = %@", company.uid.uuidString)
            do {
                if let object = try context.fetch(fetchRequest).first {
                    context.delete(object)
                    try context.save()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension CoreDataStorage: IEmployeeStorage
{
    func getEmployees(for company: CompanyModel) -> [EmployeeModel] {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY holder.uid = '\(company.uid)'")
        do {
            let result = try self.container.viewContext.fetch(fetchRequest).compactMap{ EmployeeModel(employee: $0) }
            return result
        } catch {
            print(error.localizedDescription)
            return [EmployeeModel]()
        }
    }
    
    func createEmployee(employee: EmployeeModel, completion: @escaping () -> Void) {
        self.container.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "\(#keyPath(Company.uid)) = '\(employee.companyUid)'")
            do {
                if let company = try context.fetch(fetchRequest).first {
                    let newEmployee = Employee(context: context)
                    newEmployee.holder = company
                    newEmployee.uid = employee.uid
                    newEmployee.name = employee.name
                    newEmployee.age = employee.age
                    newEmployee.position = employee.position
                    newEmployee.education = employee.education
                    newEmployee.experience = employee.experience
                }
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async { completion() }
        }
    }
    
    func updateEmployee(employee: EmployeeModel, completion: @escaping () -> Void) {
        self.container.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "\(#keyPath(Employee.uid)) = %@", employee.uid.uuidString)
            do {
                if let updatedEmployee = try context.fetch(fetchRequest).first {
                    updatedEmployee.name = employee.name
                    updatedEmployee.age = employee.age
                    updatedEmployee.position = employee.position
                    updatedEmployee.experience = employee.experience
                    updatedEmployee.education = employee.education
                }
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async { completion() }
        }
    }
    
    func removeEmployee(employee: EmployeeModel) {
        self.container.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "\(#keyPath(Employee.uid)) = %@", employee.uid.uuidString)
            do {
                if let removedEmployee = try context.fetch(fetchRequest).first {
                    context.delete(removedEmployee)
                    try context.save()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
