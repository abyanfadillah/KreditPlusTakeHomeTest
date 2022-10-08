//
//  ItemDetailView.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item
    let imageSize: CGFloat = 300
    var body: some View {
        let formattedPrice = "$" + String(item.price)
        let formattedRate = String("✩" + String((item.rating?.rate)!))
        ScrollView {
            VStack {
                    AsyncImage(url: URL(string: item.image)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame( height: imageSize)
                                .clipped()
                            
                        } else if phase.error != nil {
                            
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                        
                    }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(item.title)
                        .font(.headline)
                    Text(item.description)
                        .font(.footnote)
                    
                    VStack {
                        HStack{
                            Text("Category")
                                .font(.headline)
                            Spacer()
                            Text(item.category)
                                .font(.subheadline)
                        }
                        HStack{
                            Text("Price")
                                .font(.headline)
                            Spacer()
                            Text(formattedPrice)
                                .font(.subheadline)
                        }
                        HStack{
                            Text("Rating")
                                .font(.headline)
                            Spacer()
                            Text(formattedRate)
                                .font(.subheadline)
                        }
                 
               
                        }
                    
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
