//
//  ThirdViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 02.05.2021.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let hobbyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 35
        return imageView
    }()
    
    let hobbyNameLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let hobbyDescriptionLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    let hobbyPlannedLable: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setInfo()
        animationImage()
    }
    
    func configureUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leadingMargin)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin)
        }

        scrollView.addSubview(hobbyImageView)
        hobbyImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(scrollView.snp.top).offset(5)
            make.width.height.equalTo(scrollView.snp.width).multipliedBy(0.9)
        }

        scrollView.addSubview(hobbyNameLabel)
        hobbyNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(hobbyImageView.snp.bottom).offset(10)
            make.width.equalTo(scrollView.snp.width).multipliedBy(0.9)
        }
        
        scrollView.addSubview(hobbyDescriptionLabel)
        hobbyDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hobbyNameLabel.snp.bottom).offset(10)
            make.left.equalTo(scrollView.snp.left).offset(10)
            make.width.equalTo(scrollView.snp.width).multipliedBy(0.9)
        }
        
        scrollView.addSubview(hobbyPlannedLable)
        hobbyPlannedLable.snp.makeConstraints { (make) in
            make.top.equalTo(hobbyDescriptionLabel.snp.bottom).offset(10)
            make.left.equalTo(scrollView.snp.left).offset(10)
            make.width.equalTo(scrollView.snp.width).multipliedBy(0.9)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-5)
        }
    }
    
    func setInfo() {
        hobbyImageView.image = UIImage(named: Constants.hobbyImageName)
        hobbyNameLabel.text = Constants.hobbyName
        hobbyDescriptionLabel.text = Constants.hobbyDescription
        hobbyPlannedLable.text = Constants.hobbyPlanned
    }
    
    func animationImage() {
        UIImageView.animate(withDuration: 1.0, delay: 2.0,
                            options: .curveEaseInOut,
                            animations: {
                                self.hobbyImageView.alpha = 0.0
                            },
                            completion: nil
        )
    }
}
