//
//  NewsModel.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 09/07/2024.
//

import Foundation

struct NewsModel: Codable {
    let title, newsDescription: String?
    let newsImage: String?
    let newsLink: String?
}

typealias Results = [NewsModel]
