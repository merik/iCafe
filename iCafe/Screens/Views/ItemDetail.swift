//
//  ItemDetail.swift
//  iCafe
//
//  Created by Erik Mai on 25/6/20.
//  Copyright © 2020 Erik Mai. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                    
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }
            .font(.headline)
            .buttonStyle(ButtonGradientBackgroundStyle())
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        ItemDetail(item: MenuItem.example).environmentObject(order)
    }
}
