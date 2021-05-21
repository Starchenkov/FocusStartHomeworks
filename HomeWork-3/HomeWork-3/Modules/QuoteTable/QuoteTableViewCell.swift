//
//  QuteTableViewCell.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//

import UIKit

final internal class QuoteTableViewCell: UITableViewCell, QuoteCellViewProtocol
{
    static let identifier = "QuoteTableViewCell"
    
    private let quoteTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let autorTextLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        return lable
    }()
    
    private let imageQuote: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.selectionStyle = .none
        self.contentView.addSubview(quoteTextLabel)
        self.contentView.addSubview(autorTextLable)
        self.contentView.addSubview(imageQuote)
        
        imageQuote.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.width.height.equalTo(contentView.snp.height).multipliedBy(0.9)
        }
        quoteTextLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-10)
            make.left.equalTo(imageQuote.snp.right).offset(10)
        }
        autorTextLable.snp.makeConstraints { (make) in
            make.top.equalTo(quoteTextLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.left.equalTo(imageQuote.snp.right).offset(10)
        }
    }
    
    func set(model: QuoteCellModel) {
        self.quoteTextLabel.text = model.text
        self.autorTextLable.text = model.autor
        self.imageQuote.image = UIImage(named: model.image)
    }
}
