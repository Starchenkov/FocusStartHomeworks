//
//  File.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 16.05.2021.
//

protocol DataModelProtocol {
    var iosInfo: IOSDevInfo { get }
    var hobbyInfo: HobbyInfo { get }
    var quoteInfo: [QuoteInfo] { get }
}
