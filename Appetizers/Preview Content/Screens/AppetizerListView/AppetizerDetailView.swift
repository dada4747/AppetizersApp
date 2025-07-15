//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Rahul on 12/07/25.
//

import SwiftUI
import Foundation

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetal : Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    NutrtionInfoView(title: "Calories", value: appetizer.calories)
                    NutrtionInfoView(title: "Carbs", value: appetizer.carbs)
                    NutrtionInfoView(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetal =  false
                
            } label: {
//                APButton(title: Text("$\(appetizer.price, specifier: "%.2f") - Add to Order"))
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StanderdButtonStyle())

            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( Button {
            print("dissmiss")
            isShowingDetal = false
        } label: {
            XDissmissButton()
            
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizers, isShowingDetal: .constant(true))
}


struct NutrtionInfoView: View {
    let title : String
    let value : Int
    
    var body: some View {
        VStack{
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
                            
