//
//  Second.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 15.05.2021.
//


import UIKit

class SecondScreenView: UIView
{    
    var tapCollectionButtonHandler: (() -> (Void))?
    var tapChangeDataButtonHandler: (() -> (Void))?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let imageIosView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let jobNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionIosLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let waitingOfFocusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Коллекция", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapCollectionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let changeDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить данные", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapChangeDataButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        scrollView.addSubview(imageIosView)
        imageIosView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageIosView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
        imageIosView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        imageIosView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        
        scrollView.addSubview(jobNameLabel)
        jobNameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        jobNameLabel.topAnchor.constraint(equalTo: imageIosView.bottomAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(descriptionIosLabel)
        descriptionIosLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        descriptionIosLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        descriptionIosLabel.topAnchor.constraint(equalTo: jobNameLabel.bottomAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(waitingOfFocusLabel)
        waitingOfFocusLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        waitingOfFocusLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        waitingOfFocusLabel.topAnchor.constraint(equalTo: descriptionIosLabel.bottomAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(collectionButton)
        collectionButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        collectionButton.topAnchor.constraint(equalTo: waitingOfFocusLabel.bottomAnchor, constant: 15).isActive = true
        collectionButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        
        scrollView.addSubview(changeDataButton)
        changeDataButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        changeDataButton.topAnchor.constraint(equalTo: collectionButton.bottomAnchor, constant: 15).isActive = true
        changeDataButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        changeDataButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
    }
    
    func setInfo(with iosInfo: IOSDevInfo) {
        imageIosView.image = UIImage(named: iosInfo.iOSImageName)
        jobNameLabel.text = iosInfo.iOSJobName
        descriptionIosLabel.text = iosInfo.iOSDescriptions
        waitingOfFocusLabel.text = iosInfo.iOSWaitngOfFocus
    }
    
    @objc private func didTapCollectionButton(sender:UIButton) {
        self.tapCollectionButtonHandler?()
    }
    
    @objc private func didTapChangeDataButton(sender: UIButton) {
        self.tapChangeDataButtonHandler?()
    }
}
