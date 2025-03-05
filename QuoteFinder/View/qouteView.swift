//
//  ContentView.swift
//  QuoteFinder
//
//  Created by Julien Hwang on 4/3/2025.
//

import SwiftUI

struct qouteView: View {
    
    //MARK: Stored properties
    
    //Create the View model
    @State var viewModel = QuoteViewModel()
    
    @State var buttonOpacity = 0.0
    // Starts a timer to wait on revealing button to get new joke
    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            //Show quotes
            if let currentQuote = viewModel.currentQuote {
                Group {
                    Text(currentQuote.quoteText)
                        .padding()
                    Text(currentQuote.quoteAuthor)
                    
                }
                Button {
                 
                    // Hide punchline and button
                    withAnimation {
                        viewModel.currentQuote = nil
                        buttonOpacity = 0.0
                    }
                                        
                    // Get a new joke
                    Task {
                        await viewModel.fetchQuote()
                    }
                    
                    // Restart timers
                    buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
                    
                } label: {
                 
                    Text("New Quote")
                    
                }
                .buttonStyle(.borderedProminent)
                .opacity(buttonOpacity)
                .onReceive(buttonTimer) { _ in
                    
                    withAnimation {
                        buttonOpacity = 1.0
                    }
                    
                    // Stop the timer
                    buttonTimer.upstream.connect().cancel()
                }
 
            }
        }
        .padding()
    }
}

#Preview {
    qouteView()
}
