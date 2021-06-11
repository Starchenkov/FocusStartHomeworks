//
//  CompanyScreenCell.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import UIKit

final class CompanyScreenCell: UITableViewCell
{
    static let identifier = "CompanyCell"
    
    private var nameCompany: UILabel = {
        let label = UILabel()
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.configureCell()
    }
    
    func update(vm: CompanyScreenViewModel) {
        self.nameCompany.text = vm.nameCompany
    }
    
    private func configureCell() {
        self.accessoryType = .disclosureIndicator
        self.contentView.addSubview(self.nameCompany)
        self.nameCompany.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
       
    }
}
