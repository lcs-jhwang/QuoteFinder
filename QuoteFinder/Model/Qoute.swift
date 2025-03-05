//
//  Untitled.swift
//  QuoteFinder
//
//  Created by Julien Hwang on 4/3/2025.
//

import Foundation

struct Qoute: Identifiable, Codable {
    //MARK: Stored Properties
    var quoteText: String
    var quoteAuthor: String
    var senderName: String
    var senderLink: String
    var quteLink: String
    let id: Int
    
}

let exampleQuote = Qoute(quoteText: "Hi",
                         quoteAuthor: "Me",
                         senderName: "Also me",
                         senderLink: "",
                         quteLink: "",
                         id: 123)
