//
//  GetNewsResponce.swift
//  lection 17
//
//  Created by Даниил Петров on 06.06.2021.
//
 
struct GetNewsResponce: Decodable {
    let status: String
    let articles: [Articles]
}

struct Articles: Decodable {
    let source: Source
    let title: String
    let urlToImage: String?
    let publishedAt: String
    let description: String?
}

struct Source: Decodable {
    let id: String?
    let name: String
}
