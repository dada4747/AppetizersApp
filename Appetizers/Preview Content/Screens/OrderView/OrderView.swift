//
//  OrderView.swift
//  Appetizers
//
//  Created by Rahul on 10/07/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject  var order: Order
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button{
                        
                    } label: {
//                        APButton(title: Text("$\(order.totalPrice, specifier: "%.2f"), - Place Order"))
                        Text("$\(order.totalPrice, specifier: "%.2f"), - Place Order")
                    }
                    .modifier(StanderdButtonStyle())
//                    .standerdButtonStyle()
//                    .buttonStyle(.bordered)
//                    .tint(.brandPrimary)
//                    .controlSize(.large)
                    .padding(.bottom, 25)
                    
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Please add an appetizer!")
                }
            }
            
            .navigationTitle("🎁 Orders")
        }
    }
    
}

#Preview {
    OrderView()
}
