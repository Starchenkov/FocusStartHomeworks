//
//  ImageTableViewCell.swift
//  HomeWork-7
//
//  Created by Sergey Starchenkov on 28.05.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell
{    
    static let identifier = "ImageTableViewCell"
    
    private var downloadImage: UIImageView = {
        var image = UIImageView()
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        image.contentMode = UIView.ContentMode.scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        self.selectionStyle = .none
        self.contentView.addSubview(downloadImage)
        
        downloadImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(5)
        }
    }
    
    func set(with model: ImageData) {
        self.downloadImage.image = model.image
    }
}
