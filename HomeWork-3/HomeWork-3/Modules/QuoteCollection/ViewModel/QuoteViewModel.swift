//
//  QuoteViewModel.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 27.05.2021.
//

protocol QuotesViewModelProtocol: AnyObject {
    func numberOfQuotes() -> Int
    func quotesCellViewModel(forIndex index: Int) -> QuoteCellViewModelProtocol
}

class QuotesViewModel: QuotesViewModelProtocol
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
    
    public func quotesCellViewModel(forIndex index: Int) -> QuoteCellViewModelProtocol {
        let quote = quoteArray[index]
        return QuoteCellViewModel(quote: quote)
    }
    
    private func convertData() {
        self.quoteArray = model.quoteInfo
    }
}
