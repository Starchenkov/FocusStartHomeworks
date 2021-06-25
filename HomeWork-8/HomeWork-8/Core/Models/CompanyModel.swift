//
//  CompanyModel.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//
import Foundation

final class CompanyModel
{
    let uid: UUID
    let name: String
    
    init(name: String) {
        self.uid = UUID()
        self.name = name
    }
    
    init?(company: Company) {
        guard let uid = company.uid,
              let name = company.name else { return nil }
        self.uid = uid
        self.name = name
    }
}
