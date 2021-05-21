//
//  TableViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//
import Foundation
import UIKit

final internal class QuoteViewController: UIViewController
{
    
    private var tableView = UITableView()
    private var quoteArray = [QuoteInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoggerVC.viewDidLoadPrint(String(describing: type(of: self)))
        self.configureTable()
        self.initialize()
    }
    
    private func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.identifier)
        tableView.separatorStyle = .none
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(5)
        }
    }
    
    private func initialize() {
        quoteArray = DataModel.init().quoteInfo
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension QuoteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quoteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.identifier, for: indexPath) as! QuoteTableViewCell
       
        let _ = QuoteCellPresenter(model: quoteArray[indexPath.row], cellView: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: LoggerVC
extension QuoteViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LoggerVC.viewWillAppearPrint(String(describing: type(of: self)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LoggerVC.viewDidAppearPrint(String(describing: type(of: self)))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LoggerVC.viewWillDisappearPrint(String(describing: type(of: self)))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LoggerVC.viewDidDisappear(String(describing: type(of: self)))
    }
}

