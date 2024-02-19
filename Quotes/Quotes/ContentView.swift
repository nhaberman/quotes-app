//
//  ContentView.swift
//  Quotes
//
//  Created by Nick Haberman on 2/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Quote.quoteTime, order: .reverse) private var quotes: [Quote]
    @State private var showAddQuoteSheet: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(quotes) { quote in
                    NavigationLink {
                        QuoteDetailView(quote: quote)
                        
                    } label: {
                        QuoteView(quote: quote)
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button {
                        showAddQuoteSheet = true
                    } label: {
                        Label("AddQuote", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Quotes")
            .sheet(isPresented: $showAddQuoteSheet) {
                print("goodbye add quote sheet")
            } content: {
                AddQuoteView()
            }

        } detail: {
            Text("Select a quote")
        }
    }

    private func addItem() {
        withAnimation {
            let newQuote = Quote(quoteText: "\"This is a test quote.\"", quoteTime: Date())
            modelContext.insert(newQuote)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(quotes[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Quote.self, inMemory: true)
}
