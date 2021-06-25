//
//  EmployeeEditScreenRouter.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import UIKit

protocol IEmployeeEditScreenRouter: AnyObject
{
    func close()
}

final class EmployeeEditScreenRouter: IEmployeeEditScreenRouter
{
    weak var controller: UIViewController?
    
    func close() {
        self.controller?.navigationController?.dismiss(animated: true, completion: nil)
    }
}
