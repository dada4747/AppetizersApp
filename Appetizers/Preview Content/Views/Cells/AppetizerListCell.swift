//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Rahul on 10/07/25.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack{
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
////                .scaledToFill()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            AsyncImage(url: URL(string: NetworkManager.baseURL + appetizer.imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(8)
                        } placeholder: {
                            Image("food-placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(8)
                        }



            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizers)
}
