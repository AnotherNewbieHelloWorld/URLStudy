//
//  DataProvider.swift
//  URLStudy
//
//  Created by Apple User on 15.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import UIKit

class DataProvider: NSObject {
    
    private var downloadTask: URLSessionDownloadTask!
    var fileLocation: ((URL) -> ())?
    var onProgress: ((Double) -> ())?
    
    private lazy var bgSession: URLSession = {
        
        let config = URLSessionConfiguration.background(withIdentifier: "ru.swiftbook.Networking")
        config.isDiscretionary = true // Запуск задачи в оптимальное время (по умолчанию false)
        config.timeoutIntervalForRequest = 300 // Время ожидания сети в секундах
        config.waitsForConnectivity = true // Ожидание подключения к сети (по умолчанию false)
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    func startDownload(){
        
        if let url = URL(string: "https://speed.hetzner.de/100MB.bin"){
            
            downloadTask = bgSession.downloadTask(with: url)
            downloadTask.earliestBeginDate = Date().addingTimeInterval(3)
            downloadTask.countOfBytesClientExpectsToSend = 512
            downloadTask.countOfBytesClientExpectsToReceive = 100 * 1024 * 1024
            downloadTask.resume()
        }
    }
    
    func stopDownload(){
        downloadTask.cancel()
    }
    
}

// по завершении фоновой передачи данных, приложение перезапустится в фоновом режиме и вызовет метод urlSessionDidFinishEvents
extension DataProvider: URLSessionDelegate{
    
    // данный метод будет вызываться по завершению всех фоновых задач помещенных в очередь с нашим идентификатором приложения который мы должны будем передать в appDelegate
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        
        DispatchQueue.main.async {
            guard
                let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                let complitionHandler = appDelegate.bgSessionCompletionHandler
                else { return }
            
            appDelegate.bgSessionCompletionHandler = nil
            complitionHandler()
        }
    }
}

extension DataProvider: URLSessionDownloadDelegate{
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print("Did finish downloading: \(location.absoluteString)")
        
        DispatchQueue.main.async {
            self.fileLocation?(location)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else { return }
        
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        print("Download progress: \(progress)")
        
        DispatchQueue.main.async {
            self.onProgress?(progress)
        }
    }
}
