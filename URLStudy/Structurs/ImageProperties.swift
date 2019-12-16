//
//  ImageProperties.swift
//  URLStudy
//
//  Created by Apple User on 11.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import UIKit

struct ImageProperties {
    
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String){
        
        self.key = key
        guard let data = image.pngData() else { return nil }
        self.data = data
    }
}
