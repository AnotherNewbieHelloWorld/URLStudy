//
//  ImageViewController.swift
//  URLStudy
//
//  Created by Apple User on 08.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
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
        
        guard let url = URL(string: "https://s2.kinoteatr.ru/upload/movies/5083/screenshots/42162.jpg?_ga=2.23177912.384338816.1575783657-2081613416.1569727289") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let data = data, let image = UIImage(data: data){
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}
