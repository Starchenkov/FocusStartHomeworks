//
//  ViewController.swift
//  HomeWork-7
//
//  Created by Sergey Starchenkov on 28.05.2021.
//

import UIKit
import SnapKit

protocol MainViewProtocol: AnyObject
{
    func showAlert(title: String, message: String)
    func reloadData()
    func updateDownloadProgress(progress: Float)
}

class MainViewController: UIViewController
{
    let presenter: MainPresenterProtocol
    
    // MARK:- UI-elements
    private var urlTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .URL
        textField.returnKeyType = .go
        textField.clearButtonMode = .whileEditing
        textField.placeholder = Constants.textFieldURLPlaceholderText
        return textField
    }()
    private var progressView: UIProgressView = {
        var progressView = UIProgressView()
        progressView.progress = 0.0
        progressView.isHidden = true
        return progressView
    }()
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        return tableView
    }()
    
    // MARK:- initialization
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        presenter.viewIsLoaded(view: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.reloadData()
    }
    
    // MARK:- ConfigureUI
    private func configUI() {
        self.view.backgroundColor = .white
        self.configTextField()
        self.configProgressView()
        self.configTableView()
    }
    
    private func configTextField() {
        self.urlTextField.delegate = self
        self.view.addSubview(urlTextField)
        self.urlTextField.snp.makeConstraints { (make) in
            make.left.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.97)
        }
    }
    
    private func configProgressView() {
        self.view.addSubview(progressView)
        self.progressView.snp.makeConstraints { (make) in
            make.top.equalTo(urlTextField.snp.bottom).offset(5)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.width.equalTo(urlTextField.snp.width)
        }
    }
    
    private func configTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isHidden = true
        self.tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(progressView.snp.bottom).offset(10)
            make.left.bottom.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowTable()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell else {
            return UITableViewCell() }
        presenter.configCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK:- UITextFieldDelegate
extension MainViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let text = textField.text else { return }
        textField.text = ""
        presenter.downloadButtonTap(text: text)
    }
}

// MARK:- MainViewProtocol
extension MainViewController: MainViewProtocol
{
    func reloadData() {
        self.tableView.isHidden = false
        self.progressView.isHidden = true
        self.tableView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func updateDownloadProgress(progress: Float) {
        self.progressView.isHidden = false
        self.progressView.progress = progress
    }
}
