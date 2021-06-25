//
//  CompanyScreenViewController.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 08.06.2021.
//

import UIKit
import SnapKit

protocol ICompanyScreenController: AnyObject
{
    func updateUI()
}

final class CompanyScreenViewController: UIViewController
{
    private let presenter: ICompanyScreenPresenter
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    init(presenter: ICompanyScreenPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(viewController: self)
        self.addSubviews()
        self.makeConstraints()
        self.configureTableView()
        self.configureNavBar()
    }
}

extension CompanyScreenViewController
{
    private func addSubviews() {
        view.addSubview(self.tableView)
    }
    
    private func makeConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CompanyScreenCell.self, forCellReuseIdentifier: CompanyScreenCell.identifier)
    }
    
    private func configureNavBar() {
        self.title = Constants.companyScreenTitle
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createCompanyTapped))
        self.navigationController?.navigationBar.barTintColor = .secondarySystemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc private func createCompanyTapped() {
        let alert = UIAlertController(title: Constants.companyAlertTitle, message: Constants.companyAlertMessage, preferredStyle: .alert)
        let addAction = UIAlertAction(title: Constants.companyActionAddTitle, style: .default) { _ in
            guard let companyName = alert.textFields?[0].text else { return }
            self.presenter.createCompany(with: companyName)
        }
        let cancelAction = UIAlertAction(title: Constants.companyActionCancelTitle, style: .cancel, handler: nil)
        addAction.isEnabled = false
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        alert.addTextField { textField in
            textField.placeholder = Constants.companyAlertMessage
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main) { notification in
                addAction.isEnabled = textField.text?.count != 0
            }
        }
        present(alert, animated: true, completion: nil)
    }
}

extension CompanyScreenViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter.getCountCompanies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CompanyScreenCell.identifier, for: indexPath) as? CompanyScreenCell else {
            return UITableViewCell()
        }
        self.presenter.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

extension CompanyScreenViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.showEmploees(forSelected: indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: Constants.companyActionDeleteTitle, handler: { (_, _, _) in
            self.presenter.removeCompany(indexPath: indexPath)
        })
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension CompanyScreenViewController: ICompanyScreenController
{
    func updateUI() {
        tableView.reloadData()
    }
}
