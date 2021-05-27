//
//  QuteCellViewModel.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 27.05.2021.
//

protocol QuoteCellViewModelProtocol: AnyObject {
    var quoteAutor: String { get }
    var quoteImage: String { get }
}

class QuoteCellViewModel: QuoteCellViewModelProtocol
{
    public var quoteAutor: String {
        return quote.quoteAutor
    }
    public var quoteImage: String {
        return quote.quoteImage
    }
    
    private var quote: QuoteInfo
    
    init(quote: QuoteInfo) {
        self.quote = quote
    }
}
