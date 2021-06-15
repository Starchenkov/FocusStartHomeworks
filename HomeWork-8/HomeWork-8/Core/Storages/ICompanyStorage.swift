//
//  ICompanyStorage.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//
protocol ICompanyStorage
{
    func getCompanies() -> [CompanyModel]
    func createCompany(company: CompanyModel)
    func removeCompany(company: CompanyModel)
}
