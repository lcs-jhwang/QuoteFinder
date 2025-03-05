//
//  QuoteViewModel.swift
//  QuoteFinder
//
//  Created by Julien Hwang on 4/3/2025.
//

import Foundation

@Observable
class QuoteViewModel {
    
    var currentQuote: Qoute?
    
    //MARK: Initializers
    init(currentQuote: Qoute? = nil) {
        self.currentQuote = currentQuote
        
        Task {
            await self.fetchQuote()
        }
    }
    
    //MARK: Functions
    
    func fetchQuote() async {
        let endpoint = "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint")
            return
        }
        do {
            
            // Fetch the data
            let (data, _) = try await URLSession.shared.data(from: url)
 
            // Print the received data in the debug console
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
            
            // 3. Decode the data into a Swift data type
            
            // Create a decoder object to do most of the work for us
            let decoder = JSONDecoder()
            
            // Use the decoder object to convert the raw data
            // into an instance of our Swift data type
            let decodedData = try decoder.decode(Qoute.self, from: data)
            
            // If we got here, decoding succeeded,
            // return the instance of our data type
            self.currentQuote = decodedData
            
        } catch {
            
            // Show an error that we wrote and understand
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            // Show the detailed error to help with debugging
            print(error)
            
        }
    }
        
}

