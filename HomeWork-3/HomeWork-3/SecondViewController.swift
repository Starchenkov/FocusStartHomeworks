//
//  SecondViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 02.05.2021.
//

import UIKit

internal final class SecondViewController: UIViewController
{
    
    internal var handler: (() -> (Void))? = nil
    
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
        button.addTarget(self, action: #selector(collectionButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoggerVC.viewDidLoadPrint(String(describing: type(of: self)))
        configureUI()
        setInfo()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
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
        
        scrollView.addSubview(collectionButton)
        collectionButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        collectionButton.topAnchor.constraint(equalTo: waitingOfFocusLabel.bottomAnchor, constant: 15).isActive = true
        collectionButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        collectionButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setInfo() {
        imageIosView.image = UIImage(named: Constants.iOSImageName)
        jobNameLabel.text = Constants.iOSJobName
        descriptionIosLabel.text = Constants.iOSDescriptions
        waitingOfFocusLabel.text = Constants.iOSWaitngOfFocus
    }
    
    @objc func collectionButtonClicked(sender:UIButton) {
        guard let handler = self.handler else { return }
        handler()
    }
}

// MARK: LoggerVC
extension SecondViewController {
    
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
