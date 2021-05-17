//
//  DataManager.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//

struct DataManager
{
    static func getData() -> [Quote] {
        
        return [Quote(quoteText: "Самая важная инвестиция, которую вы можете сделать, это инвестировать в себя", quoteAutor: "Уоррен Баффетт", quoteImage: "Baffett"),
                Quote(quoteText: "В моем словаре нет слова «невозможно».", quoteAutor: "Наполеон Бонапарт", quoteImage: "Napoleon"),
                Quote(quoteText: "Стоит только поверить, что вы можете – и вы уже на полпути к цели.", quoteAutor: "Теодор Рузвельт", quoteImage: "Ruzvelt")
        ]
    }
}
