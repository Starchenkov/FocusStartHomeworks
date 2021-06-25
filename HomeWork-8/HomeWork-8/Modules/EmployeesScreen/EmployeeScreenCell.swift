//
//  EmployeeScreenCell.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import UIKit

final class EmployeeScreenCell: UITableViewCell
{
    static let identifier = "EmployeeCell"
    
    private var nameEmployee: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var positionEmployee: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.configureCell()
    }
    
    func update(vm: EmployeeScreenViewModel) {
        self.nameEmployee.text = vm.nameEmployee
        self.positionEmployee.text = vm.position
    }
    
    private func configureCell() {
        self.accessoryType = .detailButton
        self.contentView.addSubview(self.nameEmployee)
        self.nameEmployee.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(15)
        }
        self.contentView.addSubview(self.positionEmployee)
        self.positionEmployee.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(nameEmployee.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
