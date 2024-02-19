//
//  Quote.swift
//  Quotes
//
//  Created by Nick Haberman on 2/18/24.
//

import Foundation
import SwiftData

@Model
final class Quote {
    var quoteText: String = ""
    var quoteTime: Date = Date.now
    var tags: [String] = [String]()
    
    init(quoteText: String, quoteTime: Date, quoteTags: [String]? = nil) {
        self.quoteText = quoteText
        self.quoteTime = quoteTime
        self.tags = quoteTags ?? [String]()
        
        //!! testing, for now
        if self.tags.isEmpty {
            self.tags.append("tag 1")
            self.tags.append("tag 2")
        }
    }
    
    private func getDateForSpeech() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        
        return formatter.string(from: quoteTime)
    }
    
    func getQuoteForSpeech() -> String {
        return "\(quoteText), \(getDateForSpeech())"
    }
}
