//
//  EmployeeModel.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//
import Foundation

final class EmployeeModel
{
    let companyUid: UUID
    let uid: UUID
    let name: String
    let age: String
    let position: String
    let experience: String?
    let education: String?
    
    init(companyUid: UUID, name: String, age: String, position: String, experience: String?, education: String?) {
        self.companyUid = companyUid
        self.uid = UUID()
        self.name = name
        self.age = age
        self.position = position
        self.experience = experience
        self.education = education
    }
    
    init(companyUid: UUID, uid: UUID, name: String, age: String, position: String, experience: String?, education: String?) {
        self.companyUid = companyUid
        self.uid = uid
        self.name = name
        self.age = age
        self.position = position
        self.experience = experience
        self.education = education
    }
    
    
    init?(employee: Employee) {
        guard let companyUid = employee.holder?.uid,
              let uid = employee.uid,
              let name = employee.name,
              let age = employee.age,
              let position = employee.position else { return nil }
        self.companyUid = companyUid
        self.uid = uid
        self.name = name
        self.age = age
        self.position = position
        self.experience = employee.experience
        self.education = employee.education
    }
}
