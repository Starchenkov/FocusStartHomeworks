//
//  EmployeeEditViewController.swift
//  HomeWork-8
//
//  Created by Sergey Starchenkov on 10.06.2021.
//

import UIKit

protocol IEmployeeEditScreenController: AnyObject
{
    func showAlert(message: String)
}

final class EmployeeEditViewController: UIViewController
{
    private let presenter: IEmployeeEditPresenter
    var employee: EmployeeModel? {
        didSet {
            self.nameTextField.text = employee?.name
            self.ageTextField.text = employee?.age
            self.positionTextField.text = employee?.position
            self.educationTextField.text = employee?.education
            self.experienceTextField.text = employee?.experience
        }
    }
    
    private var nameTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = Constants.nameTextFieldPlaceholder
        return textField
    }()
    
    private var ageTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = Constants.ageTextFieldPlaceholder
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private var positionTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = Constants.positionTextFieldPlaceholder
        return textField
    }()
    
    private var educationTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = Constants.educationTextFieldPlaceholder
        return textField
    }()
    
    private var experienceTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = Constants.experienceTextFieldPlaceholder
        textField.keyboardType = .numberPad
        return textField
    }()
    
    init(presenter: IEmployeeEditPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(viewController: self)
        self.configureNavBar()
        self.addSubviews()
        self.makeConstraints()
    }
    
    private func configureNavBar() {
        self.title = Constants.employeeEditScreenTitle
        let rightBarItem = UIBarButtonItem(title: Constants.saveEmployeeTitle , style: .done, target: self, action: #selector(saveEmployeeTapped))
        let leftBarItem = UIBarButtonItem(title: Constants.cancelEmployeeTitle , style: .plain, target: self, action: #selector(cancelEmployeeTapped))
        self.navigationController?.navigationBar.barTintColor = .secondarySystemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = rightBarItem
        self.navigationItem.leftBarButtonItem = leftBarItem
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.ageTextField)
        self.view.addSubview(self.positionTextField)
        self.view.addSubview(self.educationTextField)
        self.view.addSubview(self.experienceTextField)
    }
    
    private func makeConstraints() {
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.right.equalToSuperview().inset(10)
        }
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        positionTextField.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        educationTextField.snp.makeConstraints { make in
            make.top.equalTo(positionTextField.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        experienceTextField.snp.makeConstraints { make in
            make.top.equalTo(educationTextField.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
    }
    
    @objc private func saveEmployeeTapped() {
        self.presenter.saveEmployee(name: nameTextField.text ?? "",
                                    age: ageTextField.text ?? "",
                                    position: positionTextField.text ?? "",
                                    education: educationTextField.text ?? "",
                                    experience: experienceTextField.text ?? "")
    }
    
    @objc private func cancelEmployeeTapped() {
        self.presenter.close()
    }
}

extension EmployeeEditViewController: IEmployeeEditScreenController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.validationMessageAlert, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.validationTitleButton, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
