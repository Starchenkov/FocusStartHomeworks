//
//  ThirdViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 02.05.2021.
//

import UIKit

internal final class ThirdViewController: UIViewController
{
    
    internal var handler: (() -> (Void))? = nil
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let hobbyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 35
        return imageView
    }()
    
    private let hobbyNameLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let hobbyDescriptionLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private let hobbyPlannedLable: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    private let tableButton: UIButton = {
        let button = UIButton()
        button.setTitle("Таблица", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tableButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoggerVC.viewDidLoadPrint(String(describing: type(of: self)))
        configureUI()
        setInfo()
        animationImage()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
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
        }
        
        scrollView.addSubview(tableButton)
        tableButton.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView.snp.width).multipliedBy(0.5)
            make.centerX.equalTo(scrollView.snp.centerX)
            make.top.equalTo(hobbyPlannedLable.snp.bottom).offset(15)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-10)
        }
    }
    
    private func setInfo() {
        hobbyImageView.image = UIImage(named: Constants.hobbyImageName)
        hobbyNameLabel.text = Constants.hobbyName
        hobbyDescriptionLabel.text = Constants.hobbyDescription
        hobbyPlannedLable.text = Constants.hobbyPlanned
    }
    
    private func animationImage() {
        UIImageView.animate(withDuration: 1.0, delay: 2.0,
                            options: .curveEaseInOut,
                            animations: {
                                self.hobbyImageView.alpha = 0.0
                            },
                            completion: nil
        )
    }
    
    @objc func tableButtonClicked(sender:UIButton) {
        guard let handler = self.handler else { return }
        handler()
    }
}

// MARK: LoggerVC
extension ThirdViewController {
    
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