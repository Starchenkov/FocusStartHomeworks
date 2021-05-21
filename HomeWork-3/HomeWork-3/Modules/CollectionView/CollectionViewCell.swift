//
//  CollectionViewCell.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//

import UIKit

internal final class CollectionViewCell: UICollectionViewCell
{
    static let identifier = "CollectionViewCell"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20.0
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let nameLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        self.backgroundColor = .white
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLable)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
        }
        nameLable.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageView.snp.bottom).inset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    func config(with quote: QuoteInfo) {
        self.nameLable.text = quote.quoteAutor
        self.imageView.image = UIImage(named: quote.quoteImage)
    }
}