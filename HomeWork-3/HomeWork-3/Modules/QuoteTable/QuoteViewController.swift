//
//  TableViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//
import Foundation
import UIKit

protocol QuotePresenterProtocol {
    func viewIsLoaded(view: QuoteViewProtocol)
}

final internal class QuoteViewController: LoggerViewController
{
    private let presenter: QuotePresenterProtocol
    
    init(presenter: QuotePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        let screenView = QuoteView()
        self.view = screenView
        self.title = "Quote Table"
        self.presenter.viewIsLoaded(view: screenView)
    }
    
}
