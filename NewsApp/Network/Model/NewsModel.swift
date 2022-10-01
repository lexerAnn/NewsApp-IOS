//
//  NewsModel.swift
//  NewsApp
//
//  Created by Leslie on 09/07/2022.
//

import Foundation

// MARK: - Welcome4

struct NewsModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let author, title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// MARK: - Source
struct Source: Decodable{
    let id: String?
    let name: String?
}
