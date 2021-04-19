//
//  MainApp.swift
//  HomeWork-1
//
//  Created by Sergey Starchenkov on 19.04.2021.
//
class MainApp
{
    var cars: [Car]
    
    init(cars: [Car]) {
        self.cars = cars
    }
    
    func start() {
        print("Меню: ")
        print("1 - Добавить новый автомобиль")
        print("2 - Вывод списка автомобилей")
        print("3 - Вывод списка автомобилей с фильтром по кузову")
        print("0 - Выход")
        print()
        
        if let menuItem = Int(strongReadLine("Выберите пункт меню")) {
            switch menuItem {
            case 1:
                self.addNewCar()
                self.start()
            case 2:
                self.printAllCars()
                self.start()
            case 3:
                self.printFilteredCars()
                self.start()
            case 0:
                print("Выход")
                return
            default:
                print("Введен не существующий пункт меню")
                self.start()
            }
        }
    }
    
   func strongReadLine(_ text: String) -> String {
        print(text)
    if let inputText = readLine(), inputText != "" {
            return inputText
        }else {
            print("Повторите ввод")
            return self.strongReadLine(text)
        }
    }
    
    func inputBody() -> Car.Body {
        Car.Body.printAllCases()
        let body = strongReadLine("Введите тип кузова автомобиля (номер)")
        
        guard let bodyNumber = Int(body), let carBody = Car.Body(rawValue: bodyNumber) else {
                    print("Ошибка при вводе типа кузова")
            return self.inputBody()
                }
        return carBody
    }
    
    func addNewCar() {
        let manufacturer = strongReadLine("Введите марку автомобиля")
        let model = strongReadLine("Введите модель автомобиля")
        let carBody = inputBody()
        
        print("Введите год производства")
        let yearOfIssue = Int(readLine() ?? "")
        print("Введите гос.номер автомобиля")
        let carNumber = readLine() ?? ""
        
        let newCar = Car(manufacturer: manufacturer,
                         model: model,
                         body: carBody,
                         yearOfIssue: yearOfIssue,
                         carNumber: carNumber)
        
        cars.append(newCar)
    }
    
    func printAllCars() {
        cars.forEach { print($0.description) }
    }
    
    func printFilteredCars() {
        let carsBody = inputBody()
        let bodyList = cars.filter {
            $0.body == carsBody
        }
        bodyList.forEach { print($0.description) }
    }
}
