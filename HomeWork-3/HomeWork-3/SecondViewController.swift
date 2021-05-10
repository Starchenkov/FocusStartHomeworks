//
//  SecondViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 02.05.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let imageIosView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let jobNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionIosLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let waitingOfFocusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setInfo()
    }
    
    func configureUI() {
        view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
        waitingOfFocusLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setInfo() {
        imageIosView.image = UIImage(named: Constants.iOSImageName)
        jobNameLabel.text = Constants.iOSJobName
        descriptionIosLabel.text = Constants.iOSDescriptions
        waitingOfFocusLabel.text = Constants.iOSWaitngOfFocus
    }
}
