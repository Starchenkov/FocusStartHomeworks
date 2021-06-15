//
//  CompanyScreenPresenter.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 08.06.2021.
//

import Foundation

protocol ICompanyScreenPresenter: AnyObject
{
    func viewDidLoad(viewController: ICompanyScreenController)
    func getCountCompanies() -> Int
    func configureCell(cell: CompanyScreenCell, indexPath: IndexPath)
    func createCompany(with companyName: String)
    func removeCompany(indexPath: IndexPath)
    func showEmploees(forSelected indexPath: IndexPath)
}

final class CompanyScreenPresenter
{
    private weak var viewController: ICompanyScreenController?
    private let companyStorage: ICompanyStorage
    private let router: ICompanyScreenRouter
    private var companies: [CompanyModel]?
    
    init(companyStorage: ICompanyStorage, router: ICompanyScreenRouter) {
        self.companyStorage = companyStorage
        self.router = router
    }
}

extension CompanyScreenPresenter: ICompanyScreenPresenter
{
    func viewDidLoad(viewController: ICompanyScreenController) {
        self.viewController = viewController
        self.displayCompany()
    }
    
    func getCountCompanies() -> Int {
        return self.companies?.count ?? 0
    }
    
    func configureCell(cell: CompanyScreenCell, indexPath: IndexPath) {
        if let company = companies?[indexPath.row] {
            let viewModel = self.convertViewModel(company: company)
            cell.update(vm: viewModel)
        }
    }
    
    func createCompany(with companyName: String) {
        let newCompany = CompanyModel(name: companyName)
        self.companyStorage.createCompany(company: newCompany)
        self.companies?.append(newCompany)
        DispatchQueue.main.async {
            self.viewController?.updateUI()
        }
    }
    
    func removeCompany(indexPath: IndexPath) {
        guard let removeCompany = companies?[indexPath.row] else { return }
        companyStorage.removeCompany(company: removeCompany)
        companies?.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.viewController?.updateUI()
        }
    }
    
    func showEmploees(forSelected indexPath: IndexPath) {
        guard let selecteedCompany = companies?[indexPath.row] else { return }
        router.openEmployees(selectedCompany: selecteedCompany)
    }
    
    private func convertViewModel(company: CompanyModel) -> CompanyScreenViewModel {
        return CompanyScreenViewModel(nameCompany: company.name)
    }
    
    private func displayCompany() {
        let result = companyStorage.getCompanies()
        self.companies = result
        DispatchQueue.main.async {
            self.viewController?.updateUI()
        }
    }
}
