//
//  APButton.swift
//  Appetizers
//
//  Created by Rahul on 13/07/25.
//

import SwiftUI

struct APButton: View {
    let title: Text
    var body: some View {
        title
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: Text("Test Title"))
}
