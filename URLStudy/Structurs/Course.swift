//
//  Course.swift
//  URLStudy
//
//  Created by Apple User on 08.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import Foundation

struct Course: Decodable{
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
