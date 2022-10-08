//
//  ItemRow.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import SwiftUI


struct ItemRow: View {
    let item: Item
    let imageHeight: CGFloat = 140
    let imageWidth: CGFloat = 136
   
    var body: some View {
        let formattedPrice = "$" + String(item.price)
        let formattedRate = String("✩" + String((item.rating?.rate)!))
        HStack  {
            VStack (alignment: .leading){
                Spacer(minLength: 20
                )
                Text(formattedPrice)
                    .font(.headline)
                    AsyncImage(url: URL(string: item.image)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFill()
                                .frame(width: imageWidth, height: imageHeight)
                                .clipped()
                            
                        } else if phase.error != nil {
                            
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageWidth, height: imageHeight)
                        } else {
                            ProgressView()
                                .frame(width: imageWidth, height: imageHeight)
                        }
                        
                    }
                }
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .font(
                            .custom(
                            "AmericanTypewriter",
                            fixedSize: 12)
                            .weight(.bold)
                        )
                Text(item.description)
                    .font(
                            .custom(
                            "AmericanTypewriter",
                            fixedSize: 10)
                            .weight(.light)
                        )
                
                Text(formattedRate)
                    .font(.headline)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .bottomTrailing)
               
                

            }
        }
        .frame( maxWidth: 320, maxHeight: 140)
     
    }
}
