//
//  EmployeeScreenViewController.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//
import UIKit

protocol IEmployeeScreenController: AnyObject
{
    func updateUI()
}

final class EmployeeScreenViewController: UIViewController
{
    private let presenter: IEmployeeScreenPresenter
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    init(presenter: IEmployeeScreenPresenter) {
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

extension EmployeeScreenViewController {
    private func addSubviews() {
        self.view.addSubview(self.tableView)
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
        self.tableView.register(EmployeeScreenCell.self, forCellReuseIdentifier: EmployeeScreenCell.identifier)
    }
    
    private func configureNavBar() {
        self.title = Constants.employeeScreenTitle
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createEmployeeTapped))
        self.navigationController?.navigationBar.barTintColor = .secondarySystemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc private func createEmployeeTapped() {
        self.presenter.createEmployee()
    }
}

extension EmployeeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getCountEmployees()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeScreenCell.identifier, for: indexPath) as? EmployeeScreenCell else {
            return UITableViewCell()
        }
        self.presenter.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

extension EmployeeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.editEmploees(forSelected: indexPath)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: Constants.companyActionDeleteTitle, handler: { (_, _, _) in
            self.presenter.removeEmployee(indexPath: indexPath)
        })
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension EmployeeScreenViewController: IEmployeeScreenController {
    func updateUI() {
        tableView.reloadData()
    }
}
