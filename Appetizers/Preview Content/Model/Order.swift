//
//  Order.swift
//  Appetizers
//
//  Created by Rahul on 13/07/25.
//

import SwiftUI
final class Order: ObservableObject {
    @Published var items : [Appetizer] =  []
 
    var totalPrice : Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
