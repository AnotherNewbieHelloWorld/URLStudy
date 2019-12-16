//
//  AppDelegate.swift
//  URLStudy
//
//  Created by Apple User on 08.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var bgSessionCompletionHandler: (() -> ())?
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        
        bgSessionCompletionHandler = completionHandler
    }
}

