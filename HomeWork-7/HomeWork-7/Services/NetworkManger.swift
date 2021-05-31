//
//  NetworkManger.swift
//  HomeWork-7
//
//  Created by Sergey Starchenkov on 28.05.2021.
//

import Foundation
import UIKit

protocol NetworkManagerProtocol
{
    var fileLocationUrl: ((URL) -> ())? { get set }
    var onProgress: ((Float) -> ())? { get set }
    func loadImage(url: String, completion: @escaping ((LoadImageError) -> Void))
}

enum LoadImageError: Error {
    case wrongURL
    case notData
}

class NetworkManager: NSObject, NetworkManagerProtocol
{
    var onProgress: ((Float) -> ())?
    var fileLocationUrl: ((URL) -> ())?
    
    private lazy var backgroundSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "background.session.download.task")
        //config.isDiscretionary = true
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    public func loadImage(url: String, completion: @escaping ((LoadImageError) -> Void)) {
        guard let url = URL(string: url) else {
            completion(.wrongURL)
            return }
        URLSession.shared.dataTask(with: url) { (_, responce, error) in
            if let _ = error {
                completion(.notData)
                return }
            
            self.startDownloadImageInBackground(url: url)
            return
        }.resume()
    }
    
    private func startDownloadImageInBackground(url: URL) {
        let downloadTask = backgroundSession.downloadTask(with: url)
        downloadTask.earliestBeginDate = Date().addingTimeInterval(2)
        downloadTask.countOfBytesClientExpectsToSend = 512
        downloadTask.countOfBytesClientExpectsToReceive = 15 * 1024 * 1024
        downloadTask.resume()
    }
}

extension NetworkManager: URLSessionDelegate
{
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                  let backgroundCompletionHandler =
                    appDelegate.backgroundCompletionHandler else {
                return
            }
            appDelegate.backgroundCompletionHandler = nil
            backgroundCompletionHandler()
        }
    }
}

extension NetworkManager: URLSessionDownloadDelegate
{
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        self.fileLocationUrl?(location.absoluteURL)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else { return }
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.onProgress?(progress)
        }
    }
}
