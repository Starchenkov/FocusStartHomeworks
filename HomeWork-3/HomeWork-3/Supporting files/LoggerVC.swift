//
//  LoggerViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//
import UIKit

class LoggerViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print(String(describing: type(of: self)) + " \(#function)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(String(describing: type(of: self)) + " \(#function)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(String(describing: type(of: self)) + " \(#function)")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(String(describing: type(of: self)) + " \(#function)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(String(describing: type(of: self)) + " \(#function)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(String(describing: type(of: self)) + " \(#function)")
    }
}
