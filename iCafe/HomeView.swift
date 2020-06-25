//
//  HomeView.swift
//  iCafe
//
//  Created by Erik Mai on 25/6/20.
//  Copyright © 2020 Erik Mai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        HomeView().environmentObject(order)
    }
}
