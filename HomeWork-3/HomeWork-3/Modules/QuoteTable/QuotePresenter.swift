//
//  QuotePresenter.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 24.05.2021.
//

import Foundation

protocol QuoteViewProtocol: AnyObject {
    var quoteCountHandler: (()->(Int))? { get set }
    var cellQuoteHandler: ((_ cell: QuoteCellViewProtocol, _ index: Int) -> Void)? { get set }
    
    func update()
}

class QuotePresenter: QuotePresenterProtocol
{
    private weak var view: QuoteViewProtocol?
    private let model: DataModelProtocol
    private var quoteCellPresenters = [QuoteCellPresenter]()
    
    init(model: DataModelProtocol) {
        self.model = model
    }
    
    public func viewIsLoaded(view: QuoteViewProtocol) {
        self.view = view
        self.view?.quoteCountHandler = { [weak self] in
            guard let self = self else { return 0 }
            return self.getCountQuotes()
        }
        self.view?.cellQuoteHandler = { [weak self] cell, index in
            guard let self = self else { return }
            self.cellWillShow(cell, at: index)
        }
        self.showQuote()
    }
    
    private func showQuote() {
        let quotes = convertData(model: self.model)
        
        for quote in quotes {
            let presentorCell = QuoteCellPresenter(model: quote)
            self.quoteCellPresenters.append(presentorCell)
        }
        self.view?.update()
    }
    
    private func getCountQuotes() -> Int {
        return self.quoteCellPresenters.count
    }
    
    private func convertData(model: DataModelProtocol) -> [QuoteInfo] {
        return model.quoteInfo
    }
    
    private func cellWillShow(_ cell: QuoteCellViewProtocol, at index: Int) {
        guard index >= 0 , index < self.getCountQuotes() else {
            assert(true, "wrong index")
            return
        }
        
        let quotePresenter = self.quoteCellPresenters[index]
        quotePresenter.viewIsLoaded(cellView: cell)
    }
}
