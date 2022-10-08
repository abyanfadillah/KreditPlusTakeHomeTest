//
//  ContentView.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var itemFetcher = ItemFetcher()
    var body: some View {
      
        if itemFetcher.isLoading {
            LoadingView()
        }else if itemFetcher.errorMessage != nil  {
            ErrorView(itemFetcher: itemFetcher)
        }else {
            ItemListView(items: itemFetcher.items)
        }
      
          
    }
}


