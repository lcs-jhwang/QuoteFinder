//
//  Untitled.swift
//  QuoteFinder
//
//  Created by Julien Hwang on 4/3/2025.
//

import Foundation

struct Qoute: Codable {
    //MARK: Stored Properties
    let quoteText: String
    let quoteAuthor: String
    let senderName: String
    let senderLink: String
    let quoteLink: String
    }

let exampleQuote = Qoute(quoteText: "Hi",
                         quoteAuthor: "Me",
                         senderName: "Also me",
                         senderLink: "",
                         quoteLink: ""
                         )
