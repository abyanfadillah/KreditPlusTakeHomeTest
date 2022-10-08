//
//  ItemListView.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import SwiftUI

struct ItemListView: View {
    let items: [Item]
    
    @State private var searchText: String = ""
    
    var filteredItems: [Item] {
        if searchText.count == 0 {
          return items
        } else {
            return items.filter { $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredItems) { item in
                    NavigationLink {
                        ItemDetailView(item: item)
                    } label: {
                        ItemRow(item: item)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Best Item For You")
            .searchable(text: $searchText)
            
        }
    }
}

