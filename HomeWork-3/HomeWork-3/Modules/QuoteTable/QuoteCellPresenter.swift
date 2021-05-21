//
//  QuotePresenter.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 21.05.2021.
//
import Foundation

protocol QuoteCellViewProtocol: AnyObject {
    func set(model: QuoteCellModel)
}

class QuoteCellPresenter {
    private var model: QuoteInfo
    private weak var cellView: QuoteCellViewProtocol?
    
    init(model: QuoteInfo, cellView: QuoteCellViewProtocol) {
        self.model = model
        self.cellView = cellView
        self.viewIsLoad()
    }
    
    private func viewIsLoad() {
        let modelCell = converterData(model: model)
        self.cellView?.set(model: modelCell)
    }
    
    private func converterData(model: QuoteInfo) -> QuoteCellModel {
        let cellModel = QuoteCellModel(text: model.quoteText,
                                       autor: model.quoteAutor,
                                       image: model.quoteImage)
        return cellModel
    }
}
