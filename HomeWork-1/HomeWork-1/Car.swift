//
//  Car.swift
//  HomeWork-1
//
//  Created by Sergey Starchenkov on 19.04.2021.
//

struct Car
{
    var description: String {
        var description = "Производитель: \(self.manufacturer) \nМодель: \(self.model) \nТип кузова: \(self.body) \n"

        if let yearOfIssue = self.yearOfIssue {
            description += "Год выпуска: \(yearOfIssue) \n"
        }else {
            description += "Год выпуска: - \n"
        }
        
        if let carNumber = self.carNumber, carNumber != "" {
            description += "Гос номер: \(carNumber) \n"
        }
        return description
    }
    
    enum Body: Int {
        
        case sedan = 1
        case jeep
        case suv
        
        static func printAllCases() {
            print("1 - sedan, 2 - jeep, 3 - suv")
        }
    }
    
    let manufacturer: String
    let model: String
    let body: Body
    let yearOfIssue: Int?
    let carNumber: String?

}
