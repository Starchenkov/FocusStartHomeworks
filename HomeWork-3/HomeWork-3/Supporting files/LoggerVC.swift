//
//  LoggerVC.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//

struct LoggerVC
{
    static func viewDidLoadPrint(_ nameController: String) {
        print("\(nameController) viewDidLoad")
    }

    static func viewWillAppearPrint(_ nameController: String) {
        print("\(nameController) viewWillAppear")
    }

    static func viewDidAppearPrint(_ nameController: String) {
        print("\(nameController) viewDidAppear")
    }

    static func viewWillDisappearPrint(_ nameController: String) {
        print("\(nameController) viewWillDisappear")
    }

    static func viewDidDisappear(_ nameController: String) {
        print("\(nameController) viewDidDisappear")
    }
}
