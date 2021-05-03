//
//  ViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 02.05.2021.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func followMeTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Подписка", message: "Вы хотите подписаться?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Подписаться", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
