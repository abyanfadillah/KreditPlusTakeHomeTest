//
//  ErrorView.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import SwiftUI


struct ErrorView: View {
    @ObservedObject var itemFetcher: ItemFetcher
    var body: some View {
        VStack {
            
            Text("😿")
                .font(.system(size: 80))
            
            Text(itemFetcher.errorMessage ?? "")
            
            Button {
                itemFetcher.fetchAllItems()
            } label: {
                Text("Try again")
            }

            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(itemFetcher: ItemFetcher())
    }
}
