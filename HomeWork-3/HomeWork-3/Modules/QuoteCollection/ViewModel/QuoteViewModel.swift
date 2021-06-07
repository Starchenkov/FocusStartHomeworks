//
//  QuoteViewModel.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 27.05.2021.
//

protocol QuoteViewModelProtocol: AnyObject {
    func numberOfQuotes() -> Int
    func quoteCellViewModel(forIndex index: Int) -> QuoteCellViewModelProtocol
}

class QuoteViewModel: QuoteViewModelProtocol
{
    private let model: DataModelProtocol
    private var quoteArray = [QuoteInfo]()
    
    init(model: DataModelProtocol) {
        self.model = model
        self.convertData()
    }
    
    public func numberOfQuotes() -> Int {
        return quoteArray.count
    }
    
    public func quoteCellViewModel(forIndex index: Int) -> QuoteCellViewModelProtocol {
        let quote = quoteArray[index]
        return QuoteCellViewModel(quote: quote)
    }
    
    private func convertData() {
        self.quoteArray = model.quoteInfo
    }
}
