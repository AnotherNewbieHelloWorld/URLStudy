//
//  WebsiteDescription.swift
//  URLStudy
//
//  Created by Apple User on 09.12.2019.
//  Copyright © 2019 Alena Khoroshilova. All rights reserved.
//

import Foundation

struct WebsiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
