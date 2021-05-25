//
//  QuoteView.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 24.05.2021.
//

import Foundation
import UIKit

class QuoteView: UIView, QuoteViewProtocol {
    
    var quoteCountHandler: (()->(Int))?
    var cellQuoteHandler: ((_ cell: QuoteCellViewProtocol, _ index: Int) -> Void)?
    
    private var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        tableView.reloadData()
    }
    
    private func configureTable() {
        self.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.identifier)
        tableView.separatorStyle = .none
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(5)
        }
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension QuoteView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteCountHandler?() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.identifier, for: indexPath) as? QuoteTableViewCell else {
            return UITableViewCell()
        }
        self.cellQuoteHandler?(cell, indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
