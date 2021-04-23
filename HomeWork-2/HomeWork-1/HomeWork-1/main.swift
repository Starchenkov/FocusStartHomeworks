//
//  main.swift
//  HomeWork-1
//
//  Created by Sergey Starchenkov on 19.04.2021.
//

let cars: [Car] = [
    Car(manufacturer: "Toyota", model: "Camry", body: .sedan, yearOfIssue: 2019, carNumber: nil),
    Car(manufacturer: "Jeep", model: "Cherokee", body: .jeep, yearOfIssue: 2013, carNumber: "Е234ЕЕ99"),
    Car(manufacturer: "Toyota", model: "Rav4", body: .suv, yearOfIssue: 2018, carNumber: nil)]

let mainApp = MainApp(cars: cars)
mainApp.start()



