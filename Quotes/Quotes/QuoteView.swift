//
//  QuoteView.swift
//  Quotes
//
//  Created by Nick Haberman on 2/18/24.
//

import SwiftUI

struct QuoteView: View {
    
    var quote: Quote
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(quote.quoteText)
                .font(.headline)
            
            Divider()
            
            HStack(content: {
                Text(quote.quoteTime, format: Date.FormatStyle(date: .abbreviated))
                    .font(.callout)
                Spacer()
                Text(quote.quoteTime, format: Date.FormatStyle(time: .shortened))
                    .font(.callout)
            })
        }
    }
}

#Preview {
    QuoteView(quote: Quote(quoteText: "\"This is a sample quote.\"", quoteTime: Date()))
}
