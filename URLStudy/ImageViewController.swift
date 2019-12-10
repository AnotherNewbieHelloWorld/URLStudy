//
//  ImageViewController.swift
//  URLStudy
//
//  Created by Apple User on 08.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    private let url = "https://s2.kinoteatr.ru/upload/movies/5083/screenshots/42162.jpg?_ga=2.23177912.384338816.1575783657-2081613416.1569727289"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }
    
    func fetchImage() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        NetworkManager.downloadImage(url: url) { (image) in
            
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
}
