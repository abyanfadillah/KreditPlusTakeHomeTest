//
//  LoadingView.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("🛒")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting the item ...")
                .foregroundColor(.gray)
            
        }
    }
}


